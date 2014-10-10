module Api
	module V1
		class RatingsController < ApiApplicationController
            before_action :set_technician, only: [ :create ]

            def index
                respond_with Rating.all
			end

            def show
                respond_with Rating.find(params[:id])
            end

            def create
                @rating = @technician.ratings.build(rating_params)
                if @rating.save
                    respond_with @rating, status: :created
                else
                    respond_with @rating.errors, status: :unprocessable_entity
                end
            end

            def update
                respond_with Rating.update(params[:id],rating_params)
            end

            def destroy
                respond_with Rating.destroy(params[:id])
            end

            private

            def set_technician
              @technician = Technician.find(params[:technician_id])
            end
            # Never trust parameters from the scary internet, only allow the white list through.
            def rating_params
              params.require(:rating).permit(:stars, :comment, :technician_id)
            end
		end
	end
end