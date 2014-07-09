
$:.unshift File.expand_path("../lib", __FILE__)

require 'wot-api/version'

Gem::Specification.new do |s|
  s.name        = "wot-api"
  s.version     = Wot::Api::VERSION
  s.authors     = ["Groza Sergiu"]
  s.email       = "info@code-panic.com"
  s.homepage    = "http://code-panic.com/wot-api"
  s.summary     = "World of Tanks API v2.0!"
  s.description = "A simple library that allows to interface with World of Tanks API v2.0!"
  s.license     = "MIT"
  s.files       = `git ls-files lib`.split("\n")

  s.add_development_dependency "json","~> 1.8"
  s.add_development_dependency "rest-client","~> 1.7"
end