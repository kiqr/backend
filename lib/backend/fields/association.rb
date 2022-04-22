# frozen_string_literal: true

module Backend
  module Fields
    class Association < Backend::Fields::Base
      def permitted_params
        ["#{model_attribute.to_s.singularize}_ids": []]
      end
    end
  end
end
