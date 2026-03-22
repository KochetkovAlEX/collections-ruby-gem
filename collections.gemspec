# frozen_string_literal: true

require_relative "lib/collections/version"

Gem::Specification.new do |spec|
  spec.name = "collections"
  spec.version = Collections::VERSION
  spec.authors = ["Kochetkov Alex"]
  spec.email = ["leshakochetcov@gmail.com"]

  spec.summary = "A Ruby gem for collections"
  spec.description = "A Ruby gem providing useful collection utilities"
  spec.homepage = "https://github.com/yourusername/collections"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*", "LICENSE.txt", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
