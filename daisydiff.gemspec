# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'daisydiff/version'

Gem::Specification.new do |spec|
  spec.name          = "daisydiff"
  spec.version       = DaisyDiff::VERSION
  spec.authors       = ["Sanjay Ginde"]
  spec.email         = ["sanjayginde@gmail.com"]
  spec.description   = "A simple ruby wrapper for Daisy Diff."
  spec.summary       = "Basic implementation that utilizes the daisydiff.jar via command line and temp files."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "cocaine", ">= 0.5.1"
  spec.add_dependency "nokogiri", ">= 1.4.2"

  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "ruby-prof"
  # spec.add_development_dependency "posix-spawn"
  

end
