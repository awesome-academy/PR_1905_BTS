class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :payment
  belongs_to :tour
end
