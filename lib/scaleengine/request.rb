class ScaleEngineAPI
  class Request
    include HTTParty
    base_uri Configuration.api_end_point

    attr_accessor :path, :query

    def initialize(path = "", query = {})
      @path = path
      @query = query
    end

    def get
      response = self.class.get(path, query: query).body
      Response.new(response)
    end

    def post
      response = self.class.post(path, query: query).body
      Response.new(response)
    end

    def delete
      response = self.class.delete(path, query: query).body
      Response.new(response)
    end

    def method_missing(method, *args)
      query = @query
      query[:command] += ".#{method}"
      
      params = args[0].is_a?(Hash) ? args[0] : {}
      params.delete(:command)
      params.keys.each do |x|
        query[x] = params[x]
      end
      
      Request.new(route, params)
    end
  end
end
