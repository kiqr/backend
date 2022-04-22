# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string  :name
      t.string  :slug
      t.text    :content
      t.boolean :deleted
      t.datetime :published_at
      t.timestamps
    end
  end
end
