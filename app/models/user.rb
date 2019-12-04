class User < ApplicationRecord
  before_save { email.downcase! }
  has_many :reviews
  has_many :likes, dependent: :destroy
  has_many :bookings
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
  validates :age, presence: true
  validates :phone, presence: true,length: { maximum: 10 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def liked? review_id
    self.likes.find_by(review_id: review_id).present?
  end

  def booked? tour_id
    self.bookings.find_by(tour_id: tour_id).present?
  end
end
