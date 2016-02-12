# encoding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "juvet/version"

Gem::Specification.new do |spec|
  spec.name          = "juvet"
  spec.version       = Juvet::VERSION
  spec.authors       = ["Jamie Wright"]
  spec.email         = ["jamie@tatsu.io"]
  spec.summary       = "The factory for bots."
  spec.description   = "A factory and storage mechanism to store your bot information, backed by Redis."
  spec.homepage      = "http://github.com/tatsuio/juvet"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.1"

  spec.add_runtime_dependency("redis")
end
