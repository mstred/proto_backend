module Api
    module V1
        class ApiApplicationController < ApplicationController
            respond_to :json
            before_filter :authenticate_token!

            def authenticate_token!
                unless check_customer_access_token!
                    render_unauthorized
                end
            end

            def check_customer_access_token!
                customer = Customer.find_by_access_token(request.headers['Token'])
                if customer != nil
                    return true
                end
                return false
            end
        end
    end
end