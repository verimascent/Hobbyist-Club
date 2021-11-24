class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :description, presence: true
  validates :time, presence: true
  validates :name, presence: true
  validates :user_id, presence: true
end
