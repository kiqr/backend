# frozen_string_literal: true

module ActionDispatch
  module Routing
    class Mapper
      def backend
        # Placeholder method for authenticatable generator.
        mount Backend::Engine => "/#{Backend.config.route_path}"
        # scope = Authenticatable.add_scope(resource, options)
        # authenticatable_scope scope do
        #   authenticatable_sessions(scope)
        #   authenticatable_registrations(scope)
        #   authenticatable_passwords(scope)
        #   yield block if block_given?
        # end
      end
    end
  end
end
