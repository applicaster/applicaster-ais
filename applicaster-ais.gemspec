# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'applicaster/ais/version'

Gem::Specification.new do |spec|
  spec.name          = "applicaster-ais"
  spec.version       = Applicaster::Ais::VERSION
  spec.authors       = ["Ran Meirman"]
  spec.email         = ["r.meirman@applicaster.com"]

  spec.description   = %q{ Applicaster Authentication Service API }
  spec.summary       = %q{ API for Applicaster Authentication }
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '0.9.1'
  spec.add_dependency 'railties', '> 3.1'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'dotenv', '~> 2.0.1'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
end
