class Booking < ApplicationRecord
  has_one :user
  has_one :payment
  has_many :tours
end
