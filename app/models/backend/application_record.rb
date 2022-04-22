# frozen_string_literal: true

module Backend
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
