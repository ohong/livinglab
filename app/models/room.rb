class Room < ApplicationRecord
  belongs_to :user
  has_many :photos

  # get lat and long w/ address
  geocoded_by :address, :latitude  => :lat, :longitude => :long #ActiveRecord
  after_validation :geocode, if: :address_changed?

  # validate room
  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bedroom, presence: true
  validates :bathroom, presence: true
  validates :listing_name, presence: true, length: {maximum: 50}
  validates :summary, presence: true, length: {maximum: 800}
  validates :address, presence: true
end
