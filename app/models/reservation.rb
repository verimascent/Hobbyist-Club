class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user_id, uniqueness: { scope: :event_id, message: "You have joined the event already." }
end
