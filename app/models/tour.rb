class Tour < ApplicationRecord
  belongs_to :booking, optional: true
  has_many  :reviews
  has_many  :ratings
  has_many  :activities
  validates :place, presence: true
  validates :price, numericality: {only_integer: true}
  validates :name, presence: true, uniqueness: true
  validates :start_at , presence: true
  validate  :start_at_cannot_less_current_time
  validates :number_of_day, presence: true
  mount_uploader :picture, PictureUploader
  validate  :picture_size
  accepts_nested_attributes_for :reviews
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
