# frozen_string_literal: true

module Backend
  class Column
    attr_reader :name, :options

    def initialize(name, **options, &block)
      default_options = {
        title: name.to_s.humanize
      }

      @name = name.to_sym
      @options = options.reverse_merge(default_options)
      @block = block
    end

    def title
      @title ||= options[:title]
    end
  end
end
