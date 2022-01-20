class User < ApplicationRecord
  validates :full_name, presence: true, length: {maximum: 30}
  validates :name, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 255},
    format: {with: /\A[\w.!#$%&'*+\/=?^`{|}~-]+@[\w-]+\.[\w-]+\z/i},
    uniqueness: true
  before_validation {email.downcase!}
  has_secure_password
  validates :password, length: {minimum: 6}, allow_nil: true
  mount_uploader :image, ImageUploader
  has_many :pictures, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
end
