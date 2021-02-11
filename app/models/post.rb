class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :description , presence: true,length: {minimum: 10,maximum: 300}
end
