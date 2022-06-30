class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates :user_id, presence: true
  validates :body, presence: true
end
