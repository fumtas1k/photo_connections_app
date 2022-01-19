class Picture < ApplicationRecord
  validates :content, length: {maximum: 2_200}
  mount_uplodar :image, ImageUploader
  belongs_to :user
end
