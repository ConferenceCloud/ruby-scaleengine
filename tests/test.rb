## NOT AN OFFICIAL TEST
## No Unit/Functional tests present
## THIS FILE IS JUST A TEMPORARY TEST SCRIPT
require "logger"
require_relative "../lib/scaleengine"

logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

ScaleEngineAPI::Configuration.api_key = ENV["SCALEENGINE_API_KEY"]
ScaleEngineAPI::Configuration.secret_key = ENV["SCALEENGINE_SECRET_KEY"]
ScaleEngineAPI::Configuration.username = ENV["SCALEENGINE_USERNAME"]
ScaleEngineAPI::Configuration.cdn = ENV["SCALEENGINE_CDN"]

se = ScaleEngineAPI.new
logger.debug se.sevu
req = se.sevu.addstreamuser({
	app: 'conferencecloud-origin', 
	stream: "conferencecloud-test", 
	user: "conferencecloud", 
	pass: "unique_random_string_per_request"
})
logger.debug req
logger.debug req.send