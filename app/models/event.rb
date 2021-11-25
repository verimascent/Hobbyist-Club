class Event < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  validates :name, :description, :date, :start_time, :end_time, :user_id, :address, :img_url, presence: true

  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
