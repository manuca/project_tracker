# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'project_tracker/version'

Gem::Specification.new do |spec|
  spec.name          = "project_tracker"
  spec.version       = ProjectTracker::VERSION
  spec.authors       = ["Manuel Barros Reyes"]
  spec.email         = ["manuca@gmail.com"]
  spec.summary       = %q{Project tracker}
  spec.description   = %q{A tool to track project time}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
end
