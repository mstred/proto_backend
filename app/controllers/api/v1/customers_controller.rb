module Api
	module V1
		class CustomersController < ApiApplicationController
            skip_before_action :authenticate_token! , only: [:create]
            before_action :set_customer, only: [:show, :update, :destroy, :customer_location]
            
            def index
                respond_with Customer.all
            end

            def show
                respond_with @customer
            end

            def create
                respond_with Customer.create(customer_params)
            end

            def update
                if @customer.update(customer_params)
                    render json: @customer, status: :ok
                else
                    render json: @customer.errors, status: :unprocessable_entity
                end
            end

            def destroy
                respond_with @customer.destroy
            end

            def customer_location
                respond_with @customer.location.to_json(only: [:id, :lat , :long] ) , status: :ok
            end

            private
                def set_customer
                    begin
                        @customer = Customer.find(params[:id])
                    rescue ActiveRecord::RecordNotFound
                        respond_with @customer , status: :not_found
                    end
                end
                # Never trust parameters from the scary internet, only allow the white list through.
                def customer_params
                  params.require(:customer).permit(:name, :email, :device_model, :gcm_id ,:password, location_attributes: [:lat , :long])
                end
		end
	end
end