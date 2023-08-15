class Grade < ApplicationRecord
  belongs_to :product
  has_rich_text :specification
  has_rich_text :content
end
