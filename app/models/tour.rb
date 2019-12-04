class Tour < ApplicationRecord
  has_many  :bookings
  has_many  :reviews, dependent: :destroy
  validates :place, presence: true
  validates :price, numericality: {only_integer: true}
  validates :name, presence: true, uniqueness: true
  validates :start_at , presence: true
  validate  :start_at_cannot_less_current_time
  validates :number_of_day, presence: true
  mount_uploader :picture, PictureUploader
  validate  :picture_size
  private
  def start_at_cannot_less_current_time
    if start_at.present? && start_at < Date.today
       errors.add(:start_at, :invalid, message: "cannot in the past")
    end
  end
  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
