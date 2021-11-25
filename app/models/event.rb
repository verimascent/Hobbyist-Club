class Event < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :description, presence: true
  validates :time, presence: true
  validates :name, presence: true
  validates :user_id, presence: true

  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
