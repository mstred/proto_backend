module Api
    module V1
        class ApiApplicationController < ApplicationController
            respond_to :json
            before_filter :authenticate_token!

            def authenticate_token!
                token = request.headers['Token']
                api_consumer_token = ENV['API_TOKEN']
                if token != api_consumer_token
                    render_unauthorized
                end
            end

            def render_unauthorized
              self.headers['WWW-Authenticate'] = 'Token realm="Application"'
              render json: 'Bad credentials', status: 401
            end
        end
    end
end