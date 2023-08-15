class Product < ApplicationRecord
  has_rich_text :content
  has_many :grades
  has_and_belongs_to_many :packings
  has_and_belongs_to_many :posts

end
