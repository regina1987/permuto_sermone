class Place < ApplicationRecord
  belongs_to :comuna

  geocoded_by :address
  after_validation :geocode

end
