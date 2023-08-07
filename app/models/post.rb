class Post < ApplicationRecord
  has_rich_text :content
  has_one_attached :image

  validate :image_content_type

  private

  def image_content_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/jpg image/png))
      errors.add(:image, 'must be a JPEG, JPG, or PNG file')
    end
  end

end
