# frozen_string_literal: true

class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.references :category, foreign_key: true
      t.string  :title
      t.string  :slug
      t.text    :body
      t.datetime :published_at
      t.timestamps
    end
  end
end
