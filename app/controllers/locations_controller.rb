class LocationsController < ApplicationController
    def index
        @places = Place.all
        @hash = Gmaps4rails.build_markers(@places) do |place, marker|
         marker.lat place.latitude
         marker.lng place.longitude
        end
    end


    def get_location
    end


    def find_address
   end
end
