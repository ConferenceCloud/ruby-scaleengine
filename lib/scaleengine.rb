require "httparty"
require "json"
require "rubybrite/configuration"
require "rubybrite/response"
require "rubybrite/request"

class ScaleEngineAPI

  def record_control
  end

  def command(command)
  end

  def method_missing(method, *args)
    params = args[0].is_a?(Hash) ? args[0] : {}
    path = ""
    if not params[:id]
    	path = "/#{method}/?token=#{@access_token}"
    else
    	# raise MissingIdException.new("#{method.capitalize} id can not be empty.") unless params[:id]
    	path = "/#{method}/#{params.delete(:id)}?token=#{@access_token}"
    end
    Request.new(path, params)
  end

  class APIException < ::Exception; end
  class MissingIdException < APIException; end
end