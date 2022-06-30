class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
  
  has_many :questions
  has_many :answers
  
end
