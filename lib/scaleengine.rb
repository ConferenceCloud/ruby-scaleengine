require "rest-client"
require "json"
require_relative "scaleengine/configuration"
require_relative "scaleengine/response"
require_relative "scaleengine/request"

class ScaleEngineAPI

  # Specific endpoint for record_controls action
  def record_control(action, params)
    if not params.is_a?(Hash)
      # Invalid params type. Not a hash
      raise InvalidParamsException.new("Params must be hash")
    elsif action.blank?
      # Missing action
      raise InvalidParamsException.new("Action must not be empty")
    end

    params[:action] = action
    Request.new(Configuration.record_control_end_point, params)
  end

  # Normal API methods found under the API documentation at https://cp.scaleengine.net/docs/api
  def method_missing(method, *args)
    params = args[0].is_a?(Hash) ? args[0] : {}

    # Set the vairous params that are required for each test
    params[:command] = "#{method}"
    params[:api_key] = Configuration.api_key
    params[:cdn] = Configuration.cdn

    Request.new(Configuration.api_end_point, params)
  end

  class APIException < ::Exception; end
  class MissingIdException < APIException; end
  class InvalidParamsException < APIException; end
end