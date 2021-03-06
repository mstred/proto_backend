module Api
	module V1
		class MessageController < ApiApplicationController
			before_filter :set_gcm_api_key
            def message_technician
                @technician = Technician.find(params[:technician_id])
                message = params[:msg]
                collapse_key = params[:collapse_key]
                notification_id = [@technician.gcm_id]

                options = { collapse_key: collapse_key, data: { msg: message } } # dry_run: true 
                response = send_gcm_message(notification_id,options)
                render json: response.to_json( only: [:body,:status_code]), status: :ok
            end

            def message_customer
                @customer = Customer.find(params[:customer_id])
                message = params[:msg]
                collapse_key = params[:collapse_key]
                notification_id = [@customer.gcm_id]

                options = { collapse_key: collapse_key, data: { msg: message } } # dry_run: true 
                response = send_gcm_message(notification_id,options)
                render json: response.to_json( only: [:body,:status_code]), status: :ok
            end

            private
            def send_gcm_message(gcm_id, payload)
                gcm = GCM.new(@api_key)
                response = gcm.send_notification(gcm_id,payload)
                return response
            end
            
            # Never trust parameters from the scary internet, only allow the white list through.
            def message_params
              params.require(:message).permit(:technician_id, :customer_id, :msg, :collapse_key)
            end

            def set_gcm_api_key
                @api_key = GCM_API_KEY
            end
		end
	end
end