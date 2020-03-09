class LocationsController < ApplicationController
  before_action :set_comunas, only: [:index]

    def index
        @places = Place.all
        if params[:comuna_id].present?
          comuna = Comuna.find(params[:comuna_id])
          lat_long = Geocoder.coordinates("#{comuna.name}, santiago, chile")
          @places = Place.near(lat_long, 5)
          flash.notice = 'No se encontraron lugares' if @places.empty?           
        end

        @hash = Gmaps4rails.build_markers(@places) do |place, marker|
         marker.lat place.latitude
         marker.lng place.longitude
         s=place.name.to_s+place.address.to_s
         marker.infowindow
        end


    end

private
    def set_comunas
    @comunas_array=Comuna.order(:name).pluck(:name, :id)
    end
end
