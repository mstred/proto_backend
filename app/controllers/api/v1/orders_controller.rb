module Api
    module V1
        class OrdersController < ApiApplicationController

            def index
                respond_with Order.all
            end

            def show
                respond_with Order.find(params[:id])
            end

            def create
                respond_with Order.create(order_params)
            end

            def update
                respond_with Order.update(params[:id], order_params)
            end

            def search
                @order = Order.find_by(params)
            end

            def destroy
                respond_with @order.destroy
            end

            private

            def order_params
                params.require('order').permit(:description , :customer_id , :technician_id, :status)
            end

        end
    end
end