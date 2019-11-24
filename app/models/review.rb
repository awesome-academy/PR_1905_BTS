class Review < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  has_many :likes, dependent: :destroy
end
