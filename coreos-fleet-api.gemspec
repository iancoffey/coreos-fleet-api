# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fleet_api/version'

Gem::Specification.new do |gem|
  gem.name          = "coreos-fleet-api"
  gem.version       = FleetAPI::VERSION
  gem.authors       = ["Ian Coffey"]
  gem.email         = ["ian.coffey@gmail.com"]
  gem.description   = %q{CoreOS Fleet Alpha API Client}
  gem.summary       = %q{Client library for communicating with the CoreOS Alpha API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "faraday", "~> 0.9"
  gem.add_dependency "faraday_middleware", "~> 0.9"
  gem.add_dependency "cistern", "~> 0.6"
  gem.add_dependency "addressable", "~> 2.2"
end
