# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'try/eager/version'

Gem::Specification.new do |spec|
  spec.name          = "try-eager"
  spec.version       = Try::Eager::VERSION
  spec.required_ruby_version = '>= 2.0.0'
  spec.authors       = ["sunaot"]
  spec.email         = ["sunao.tanabe@gmail.com"]
  spec.summary       = %q{Try to run proc repeatedly until options[:until] returns true.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/sunaot/try-eager"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
