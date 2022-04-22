# frozen_string_literal: true

Backend::Engine.routes.draw do
  # Generate routes for resources in config.
  Backend.each do |backend|
    scope backend.path, backend: backend do
      resources backend.route_key, path: "", controller: "resources"
    end
  end

  root "pages#dashboard"
end
