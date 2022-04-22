# frozen_string_literal: true

module Backend
  module Dsl
    class Form
      # include Backend::Columns
      attr_reader :backend

      # Initialize a new instance of this class for use in the backend DSL.
      def initialize(backend, &block)
        @backend = backend
        instance_eval(&block)
      end

      # Field.
      #
      # Register a new editable field for the resource.
      # The type of field can be set with the :type option.
      # The default type is :string.
      #
      # Example:
      #   field :title,  type: :string    => Backend::Fields::String.new(:title)
      #   field :body,   type: :editor    => Backend::Fields::Editor.new(:body)
      #   field :status, type: :boolean   => Backend::Fields::Boolean.new(:status)
      #
      # :api: public
      def field(model_attribute, **options, &block)
        type = options[:type] || :base

        # Build class name from :type attribute.
        # Default when no type is specified is: Backend::Fields::Base
        klass = Backend::Fields.const_get(type.to_s.classify)
        field = klass.new(model_attribute, **options, &block)

        # Insert field into the array.
        backend.fields << field
      end

      def association(model_attribute, **options, &block)
        field model_attribute, type: :association, **options, &block
      end
    end
  end
end
