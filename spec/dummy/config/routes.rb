# frozen_string_literal: true

Rails.application.routes.draw do
  backend # load Backend routes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#home"
end
