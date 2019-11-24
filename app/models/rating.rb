class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  validates :star, presence: true
end
