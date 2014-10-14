module Api
    module V1
        class TechniciansLoginController < ApplicationController
            respond_to :json
            before_filter :find_technician_by_email

            def login
                if @technician != nil && check_technician_password!
                    render json: @technician , status: :ok
                else
                    render_unauthorized
                end
            end

            private

            def find_technician_by_email
                @technician = Technician.find_by_email(login_params[:user_email])
            end

            def check_technician_password!
                if @technician.password == login_params[:user_password]
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