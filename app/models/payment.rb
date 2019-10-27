class Payment < ApplicationRecord
  has_one :booking
  has_many :activities
end
