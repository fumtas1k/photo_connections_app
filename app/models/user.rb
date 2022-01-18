class User < ApplicationRecord
  validates :full_name, presence: true, length: {maximum: 30}
  validates :name, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: /\A[\w.!#$%&'*+\/=?^`{|}~-]+@[\w-]+\.[\w-]+\z/i},
    uniqueness: true
  before_validation {email.downcase!}
  has_secure_password
  validates :password, length: {minimum: 6}
  mount_uploader :image, ImageUploader
end
