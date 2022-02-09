class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user, class_name: 'User'
  
  validates :title, presence: :true
  validates :body, presence: :true
end
