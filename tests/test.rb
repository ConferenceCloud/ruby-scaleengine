## NOT AN OFFICIAL TEST
## No Unit/Functional tests present
## THIS FILE IS JUST A TEMPORARY TEST SCRIPT
require "logger"
require "scaleengine"

logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

ScaleEngineAPI::Configuration.api_key = ENV["SCALEENGINE_API_KEY"]
ScaleEngineAPI::Configuration.secret_key = ENV["SCALEENGINE_SECRET_KEY"]
ScaleEngineAPI::Configuration.username = ENV["SCALEENGINE_USERNAME"]
ScaleEngineAPI::Configuration.cdn = ENV["SCALEENGINE_CDN"]

se = ScaleEngineAPI.new
req = se.sevu.addstreamuser({
	app: 'conferencecloud-origin', 
	stream: "conferencecloud-tester", 
	user: "conferencecloud", 
	pass: (0...16).map { (65 + rand(26)).chr }.join # Random 16 character string
})
# req = se.sevu.removestreamuser({
# 	app: 'conferencecloud-origin',
# 	stream: "conferencecloud-test",
# 	user: "conferencecloud"
# })
logger.debug req.send