class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name,  presence: true, uniqueness: true
  validates :destination, inclusion: { in: %w(mars saturn mercury venus uranus neptune moon), message: "Please type a valid Planet!" }
  validates :price, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :destination ],
    using: {
      tsearch: { prefix: true }
    }

end
