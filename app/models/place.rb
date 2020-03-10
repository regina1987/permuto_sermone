class Place < ApplicationRecord
  belongs_to :comuna, required: false

  validates :name, presence: true
  validates :address, presence: true
  validates :address, length: {minimum: 20}

  geocoded_by :address
  after_validation :geocode

end
