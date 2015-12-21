class KitchenController < ApplicationController
    def index
        @orders = Order.where(status: "cooking")
    end
    def update
        order = Order.find(params[:id])
        order.status = "cooked"
        order.save
        redirect_to kitchen_index_path
    end


    private

    def order_params
        params.require(:order).permit(:dish_id)
    end
end
