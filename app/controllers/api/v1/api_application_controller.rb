module Api
    module V1
        class ApiApplicationController < ApplicationController
            respond_to :json
            before_action :authenticate_token!

            def authenticate_token!
                unless check_customer_access_token! || check_technician_access_token!
                    render_unauthorized
                end
            end

            def check_customer_access_token!
                token = request.headers['Token']
                if token.blank?
                    return false
                end
                customer = Customer.find_by_access_token(token)
                customer.present?
            end

            def check_technician_access_token!
                token = request.headers['Token']
                if token.blank?
                    return false
                end
                technician = Technician.find_by_access_token(request.headers['Token'])
                technician.present?
            end
        end
    end
end