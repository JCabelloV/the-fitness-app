class Bookings < ApplicationRecord
  belongs_to :schedule
  belongs_to :trainer
  has_many :bookings_participants, dependent: :destroy
  has_many :users, through: :booking_participant
  enum kind: { individual: 0, duo: 1 }
  enum status: { pending: 0, confirmed: 1, cancelled: 2 }

  validate :participants_match_kind
  def participants_match_kind
    if individual? && users.size !=1
      errors.add(:base, "Individual requiere 1 participante")
    elsif duo? && users.size != 2
      errors.add(:base, "Dio requiere de 2 participantes")

    end
  end
end
