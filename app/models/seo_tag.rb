class SeoTag < ApplicationRecord
  belongs_to :taggable, polymorphic: true
end
