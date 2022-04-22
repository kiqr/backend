# frozen_string_literal: true

module Backend
  module Dsl
    class Index
      # include Backend::Columns
      attr_reader :backend

      # Initialize a new instance of this class for use in the backend DSL.
      def initialize(backend, &block)
        @backend = backend
        instance_eval(&block)
      end

      # Create an ID column.
      # :api: public
      def id
        options = { title: "ID" }
        backend.index_columns << Backend::Column.new(:id, **options)
      end

      # Dislay a column to the index table.
      # :api: public
      def column(name, **options, &block)
        backend.index_columns << Backend::Column.new(name, **options, &block)
      end
    end
  end
end
