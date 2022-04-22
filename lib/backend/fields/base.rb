# frozen_string_literal: true

module Backend
  module Fields
    class Base
      attr_reader :model_attribute, :options, :block

      def initialize(model_attribute, **options, &block)
        default_options = {
          label: model_attribute.to_s.humanize,
          type: :base,
          input_html: {}
        }

        @model_attribute = model_attribute.to_sym
        @options = options.reverse_merge(default_options)
        @block = block
      end

      def label
        options[:label]
      end

      def type
        options[:type]
      end

      def to_partial_path
        "backend/fields/#{type}"
      end

      # Returns permitted params for the field.
      #
      # :api: public
      def permitted_params
        [model_attribute]
      end

      # private

      # def create_component(form)
      #   class_name = "#{self.class.name}Component"
      #   klass = Backend::Fields.const_get(class_name.classify)
      #   klass.new(form: form, field: self)
      # end
    end
  end
end
