class  Trainer < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :bookings
end
