require 'gcm'

class MessageController < ApplicationController
    before_filter :set_gcm_api_key

    def message_technician
        @technician = Technician.find(params[:technician_id])
        message = params[:msg]
        colapse_key = params[:colapse_key]
        notification_id = [@technician.gcm_id]

        options = { colapse_key: colapse_key, data: { msg: message } } # dry_run: true 
        
        response = send_gcm_message(notification_id,options)
        
        respond_to do |format|
            format.json { render json: response.to_json , status: :ok }
        end
    end
    
    def message_customer
        @customer = Customer.find(params[:customer_id])
        message = params[:msg]
        colapse_key = params[:colapse_key]
        notification_id = [@customer.gcm_id]

        options = { colapse_key: colapse_key, data: { msg: message } } # dry_run: true 
        
        response = send_gcm_message(notification_id,options)

        respond_to do |format|
            format.json { render json: response.to_json , status: :ok }
        end
    end
    
    private

    def send_gcm_message(gcm_id, payload)
        gcm = GCM.new(@api_key)
        response = gcm.send_notification(gcm_id,payload)
        return response
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:technician_id, :customer_id, :msg, :colapse_key)
    end

    def set_gcm_api_key
        @api_key = GCM_API_KEY
    end
end