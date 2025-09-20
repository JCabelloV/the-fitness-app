class BookingParticipant < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  validates :user_id, uniqueness: { scope: :booking_id }
end
