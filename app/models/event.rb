class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations, source: :reservations_table_foreign_key_to_users_table

  validates :description, :time, presence: true

end
