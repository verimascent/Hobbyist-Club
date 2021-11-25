class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :description, :date, :name, :start_time, :end_time, :user_id, :address, presence: true
end
