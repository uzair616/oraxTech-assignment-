class Comment < ApplicationRecord
  belongs_to :post
  validates :response , presence: true
end
