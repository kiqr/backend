# frozen_string_literal: true

module Backend
  class Engine < ::Rails::Engine
    isolate_namespace Backend
  end
end
