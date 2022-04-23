# frozen_string_literal: true

require "backend/generators/resource_generator"
require "rails/generators/named_base"

class BackendGenerator < Rails::Generators::NamedBase
  desc "Creates a new Backend resource"

  source_root File.expand_path("backend/templates", __dir__)

  def generate_config_file
    @generator = Backend::Generators::ResourceGenerator.new(class_name)

    return say "Couldn't find model #{class_name}", :red unless model_exists?

    template "resource.rb.erb", "app/backend/#{file_path.tr('/', '_').singularize}_backend.rb"
  end

  private

  def model_exists?
    Object.const_defined?(class_name)
  end
end
