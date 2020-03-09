class LocationsController < ApplicationController
  before_action :set_comunas, only: [:index]

    def index

        #@places = Place.find_by(current_user.comuna.name)
        #@places=Place.where(comuna: params[:current_user][:communa])
        @places=Place.all
        @hash = Gmaps4rails.build_markers(@places) do |place, marker|
         marker.lat place.latitude
         marker.lng place.longitude
         s=place.name.to_s+place.address.to_s
         marker.infowindow s

        end
    end

private
    def set_comunas
    @comunas_array=Comuna.order(:name).pluck(:name, :id)
    end
end
