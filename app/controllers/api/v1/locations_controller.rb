module Api
    module V1
        class LocationsController < ApplicationController
            respond_to :json

            def index
                respond_with Location.all
            end

            def show
                respond_with Location.find(params[:id])
            end

            def update
                respond_with Location.update(params[:id],location_params)
            end

            private
            # Use callbacks to share common setup or constraints between actions.
            def set_location
                @location = Location.find(params[:id])
            end
            # Never trust parameters from the scary internet, only allow the white list through.
            def location_params
                params.require(:location).permit(:lat, :long, :locationable_id, :locationable_type)
            end
        end
    end
end