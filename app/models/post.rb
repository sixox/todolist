class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content
  has_one_attached :image
  has_and_belongs_to_many :products
  has_one :seo_tag, as: :taggable, dependent: :destroy
  accepts_nested_attributes_for :seo_tag


  validate :image_content_type
  validates :title, uniqueness: { case_sensitive: false }


  private

  def image_content_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/jpg image/png))
      errors.add(:image, 'must be a JPEG, JPG, or PNG file')
    end
  end

end
