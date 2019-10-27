class Tour < ApplicationRecord
  belongs_to :booking
  has_many :reviews
  has_many :ratings
  has_many :activities
end
