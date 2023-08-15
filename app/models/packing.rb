class Packing < ApplicationRecord
  has_rich_text :content
  has_rich_text :specification
  has_and_belongs_to_many :products
end
