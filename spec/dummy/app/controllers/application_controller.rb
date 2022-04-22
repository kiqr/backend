# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def home
    render html: "", status: :ok
  end
end
