class Schedule < ApplicationRecord
  belongs_to :trainer
  has_one :booking, dependent: :destroy
end
