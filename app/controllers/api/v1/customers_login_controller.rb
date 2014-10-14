module Api
    module V1
        class CustomersLoginController < ApplicationController
            respond_to :json
            before_filter :find_customer_by_email

            def login
                if @customer != nil && check_customer_password!
                    render json: @customer , status: :ok
                else
                    render_unauthorized
                end
            end

            private

            def find_customer_by_email
                @customer = Customer.find_by_email(login_params[:user_email])
            end

            def check_customer_password!
                if @customer.password == login_params[:user_password]
                    return true
                else
                    return false
                end
            end

            def login_params
                params.require(:login).permit(:user_email , :user_password)
            end
        end
    end
end