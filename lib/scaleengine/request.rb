require 'json'
require 'base64'

class ScaleEngineAPI
  class Request
    attr_accessor :path, :query

    def initialize(path = "", query = {})
      @path = path
      @query = query
    end

    def send
      body = prepare_request
      response = RestClient.post path, body
      Response.new(response)
    end

    def method_missing(method, *args)
      query_new = query
      query_new[:command] += ".#{method}"
      
      params = args[0].is_a?(Hash) ? args[0] : {}
      params.delete(:command)
      params.keys.each do |x|
        query_new[x] = params[x]
      end
      
      Request.new(path, query_new)
    end

    def prepare_request
      query[:timestamp] = Time.now.to_i
      query[:signature] = Base64.strict_encode64(request_signature)
      body = {:json => JSON.generate(query), :multipart => true}
    end

    def request_signature
      params = query
      json_params = JSON.generate(params)

      # Compute new SHA256 HMAC
      digest = OpenSSL::Digest::SHA256.new
      OpenSSL::HMAC.digest(digest, Configuration.secret_key, json_params)
    end
  end
end
