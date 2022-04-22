# frozen_string_literal: true

class CategoryBackend < Backend::Base
  self.display_name_attribute = :name

  index do
    id
    column :name
    column :slug
  end

  form do
    field :name
    field :slug, label: "Permalink", input_html: { class: "custom-input-html" }
    field :content, type: :editor
  end
end
