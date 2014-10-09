module Api
	module V1
		class CustomersController < ApiApplicationController

            def index
                respond_with Customer.all
            end

            def show
                respond_with Customer.find(params[:id])
            end

            def create
                respond_with Customer.create(customer_params)
            end

            def update
                respond_with Customer.update(params[:id],customer_params)
            end

            def destroy
                respond_with Customer.destroy(params[:id])
            end

            def customer_location
                respond_with @customer.location.to_json(only: [:id, :lat , :long] ) , status: :ok
            end

            private
                def set_customer
                    begin
                        @customer = Customer.find(params[:id])
                    rescue ActiveRecord::RecordNotFound
                        respond_with @technician , status: :not_found
                    end
                end
                # Never trust parameters from the scary internet, only allow the white list through.
                def customer_params
                  params.require(:customer).permit(:name, :email, :device_model, :gcm_id ,:password, location_attributes: [:lat , :long])
                end
		end
	end
end