class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  validates :people_number, presence: true, numericality: {less_than: 12}
  validates :phone, presence: true,length: { maximum: 10 }
  enum status: [:pending, :success, :cancel]
end
