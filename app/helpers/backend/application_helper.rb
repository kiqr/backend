# frozen_string_literal: true

module Backend
  module ApplicationHelper
    include Pagy::Frontend

    def backend_navbar_item(label, path)
      link_to label, path, class: (current_page?(path) ? "font-bold" : "")
    end
  end
end
