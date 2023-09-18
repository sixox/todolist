class Product < ApplicationRecord
  has_rich_text :content
  has_many :grades
  has_and_belongs_to_many :packings
  has_and_belongs_to_many :posts
  has_one :seo_tag, as: :taggable, dependent: :destroy
  accepts_nested_attributes_for :seo_tag

end
