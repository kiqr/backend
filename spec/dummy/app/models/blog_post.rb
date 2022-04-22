# frozen_string_literal: true

class BlogPost < ApplicationRecord
  belongs_to :category
end
