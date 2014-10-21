module Api
	module V1
		class TechniciansController < ApiApplicationController
            skip_before_action :authenticate_token! , only: [:create]
            before_action :set_technician, only: [  :show, :update, :destroy, :technician_location ]

            def index
                respond_with Technician.all
            end

            def show
                respond_with @technician
            end

            def create
                respond_with Technician.create(technician_params)
            end

            def update
                if @technician.update(technician_params)
                    render json: @technician, status: :ok
                else
                    render json: @technician.errors, status: :unprocessable_entity
                end
            end

            def destroy
                respond_with @technician.destroy
            end

            def technician_location
                if @technician.location != nil
                    respond_with @technician.location.to_json(only: [:id, :lat , :long] ) , status: :ok
                else
                    respond_with @technician.errors, status: :not_found
                end
            end

            private
                # Use callbacks to share common setup or constraints between actions.
                def set_technician
                    begin
                      @technician = Technician.find(params[:id])
                    rescue ActiveRecord::RecordNotFound
                        respond_with @technician , status: :not_found
                    end
                end
                # Never trust parameters from the scary internet, only allow the white list through.
                def technician_params
                  params.require(:technician).permit(:name, :email, :password, :gcm_id, location_attributes: [:lat , :long])
                end
		end
	end
end