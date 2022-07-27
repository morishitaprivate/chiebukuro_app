class User < ApplicationRecord
  has_secure_password
  
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true
  
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
end
