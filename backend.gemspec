# frozen_string_literal: true

require_relative "lib/backend/version"

Gem::Specification.new do |spec|
  spec.name        = "backend"
  spec.version     = Backend::VERSION
  spec.authors     = "KIQR"
  spec.email       = "hello@kiqr.dev"
  spec.homepage    = "https://github.com/kiqr/backend"
  spec.summary     = "An administration panel for Ruby on Rails."
  spec.license     = "MIT"

  spec.required_ruby_version = ">= 2.6"

  spec.files = Dir["{lib,app,public}/**/*", "LICENSE.md", "README.md"]

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/kiqr/authenticatable/issues",
    "documentation_uri" => "https://github.com/kiqr/authenticatable/issues",
    "source_code_uri" => "https://github.com/kiqr/authenticatable",
    "rubygems_mfa_required" => "true"
  }

  spec.add_dependency "dry-configurable", ">= 0.11", "< 0.16"
  spec.add_dependency "pagy", "~> 5.10"
  spec.add_dependency "simple_form", "~> 5.1"
  spec.add_dependency "trix-rails", "~> 2.4"
end
