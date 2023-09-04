class MetaTag < ApplicationRecord
  belongs_to :taggable, polymorphic: true
end
