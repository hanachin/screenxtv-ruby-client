# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'screenxtv/version'

Gem::Specification.new do |spec|
  spec.name          = "screenxtv"
  spec.version       = ScreenXTV::VERSION
  spec.authors       = ["Tomoya Ishida", "Seiei Higa"]
  spec.date          = "2013-02-26"
  spec.email         = ["tomoyapenguin@gmail.com", "hanachin@gmail.com"]
  spec.description   = %q{Software for broadcasting your terminal to http://screenx.tv/}
  spec.summary       = %q{ScreenX TV client}
  spec.homepage      = "http://screenx.tv/"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'json'
  spec.add_dependency 'thor'
  spec.add_dependency 'active_support'
end
