class Booking < ApplicationRecord
  has_one :user
  has_one :payment
  has_many :tours
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  private
  def
  def tour_present
    if tour.nil?
      errors.add(:tour, "is not valid or is not active.")
    end
  end
end
