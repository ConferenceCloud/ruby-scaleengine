# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "scaleengine/version"
#require File.expand_path('../lib/slideshare/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "ruby-scaleengine"
  s.version     = ScaleEngineAPI::VERSION
  s.licenses    = ['MIT']
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John-Alan Simmons"]
  s.email       = ["johnalan@conferencecloud.co"]
  s.homepage    = "https://github.com/ConferenceCloud/ruby-scaleengine"
  s.summary     = %q{Wrapper for the ScaleEngine API}
  s.description = %q{Wrapper for the ScaleEngine API}

  s.rubyforge_project = s.name

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {tests,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency('rest-client', '~> 1.7')
end
