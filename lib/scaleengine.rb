require "httparty"
require "json"
require "rubybrite/configuration"
require "rubybrite/response"
require "rubybrite/request"

class ScaleEngineAPI

  def record_control(params)
    if not params.is_a?(Hash)
      # Invalid params type. Not a hash
      raise InvalidParamsException.new("Params must be hash")
    end

  end

  def method_missing(method, *args)
    params = args[0].is_a?(Hash) ? args[0] : {}
    params[:command] = "#{method}"
    params[:api_key] = Configuration.api_key
    Request.new("", params)
  end

  class APIException < ::Exception; end
  class MissingIdException < APIException; end
  class InvalidParamsException < APIException; end
end