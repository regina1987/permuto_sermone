class Place < ApplicationRecord
  belongs_to :comuna, required: false

  geocoded_by :address
  after_validation :geocode

end
