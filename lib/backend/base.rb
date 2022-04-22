# frozen_string_literal: true

module Backend
  class Base
    extend ActiveSupport::DescendantsTracker
    # extend Backend::Fields

    # Define class accessors.
    class_attribute :model, instance_accessor: false
    class_attribute :model_name, instance_accessor: false
    class_attribute :path, instance_accessor: false
    class_attribute :params_key, instance_accessor: false
    class_attribute :route_key, instance_accessor: false
    class_attribute :display_name_attribute, instance_accessor: false
    class_attribute :index_columns, instance_accessor: false
    class_attribute :fields, instance_accessor: false

    class << self
      def index(&block)
        @index ||= Backend::Dsl::Index.new(self, &block)
      end

      def form(&block)
        @form ||= Backend::Dsl::Form.new(self, &block)
      end

      # The model class associated with the backend. This value
      # can be overriden in your Backend class. The default value
      # is generated from your Backend class name.
      #
      # Example:
      #   BlogPostBackend => BlogPost
      #
      # :api: public
      def model
        @model ||= name.demodulize.chomp("Backend").constantize
      end

      # The model name in a human readable format.
      # Example: "Blog post"
      #
      # :api: public
      def model_name
        @model_name ||= model.model_name.human
      end

      # A path in a URL format for use with routing. This value
      # can be overriden in your Backend class. The default value
      # is generated from your Backend class name.
      #
      # Example: "blog_posts"
      #
      # :api: public
      def path
        @path ||= model.model_name.to_s.underscore.downcase.pluralize
      end

      # Generates a full path to index of this backend.
      #
      # Example: "/backend/blog_posts"
      #
      # :api: pubic
      def full_path
        "/#{Backend.config.route_path}/#{path}"
      end

      # Route key for resource routes.
      # Example: :blog_posts
      #
      # :api: public
      def display_name_attribute
        @display_name_attribute ||= nil
      end

      # Default value for index_columns.
      def index_columns
        @index_columns ||= []
      end

      # Default value for fields.
      def fields
        @fields ||= []
      end

      # Parameter key for form requests.
      # Example: :blog_post
      #
      # :api: private
      def params_key
        @params_key ||= model.model_name.to_s.underscore.downcase.to_sym
      end

      # Route key for resource routes.
      # Example: :blog_posts
      #
      # :api: private
      def route_key
        @route_key ||= params_key.to_s.pluralize.to_sym
      end
    end
  end
end
