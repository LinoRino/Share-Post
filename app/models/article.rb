# frozen_string_literal: true

class Article < ApplicationRecord
  validations :title, :content, presence: true
  validations :title, length: { maximum: 25 }
  validations :content, length: { maximum: 5000 }
end
