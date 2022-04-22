# frozen_string_literal: true

require "backend/version"
require "backend/rails/routes"
require "backend/engine"

require "dry-configurable"
require "pagy"
require "simple_form"
require "trix"

module Backend
  extend Dry::Configurable

  autoload "Base", "backend/base"
  autoload "Column", "backend/column"

  module Dsl
    autoload "Index", "backend/dsl/index"
    autoload "Form", "backend/dsl/form"
  end

  module Fields
    autoload "Base", "backend/fields/base"
    autoload "Association", "backend/fields/association"
    autoload "Editor", "backend/fields/editor"
  end

  setting :route_path, default: "backend" # Default route scope for backend routes.

  class << self
    # Iterate through all backend classes.
    # :api: public
    delegate :each, to: :all

    # Get a list of all backend classes.
    # :api: public
    def all
      # Force eager load of all backends.
      # Todo: this could be changed to a
      # script that requires all files in app/backend.
      Rails.application.eager_load!

      # A list of all classes that has inherited from Backend::Base.
      Backend::Base.descendants
    end
  end
end
