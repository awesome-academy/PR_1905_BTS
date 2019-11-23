class User < ApplicationRecord
  before_save { email.downcase! }
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :activities
  has_one :booking, dependent: :destroy
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
  validates :age, presence: true
  validates :phone, presence: true,length: { maximum: 10 }

  def liked? review_id
    self.likes.find_by(review_id: review_id).present?
  end
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
