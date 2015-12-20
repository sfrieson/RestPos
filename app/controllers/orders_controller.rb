class OrdersController < ApplicationController
    def create
        party = Party.find(params[:party_id])
        party.orders.create(order_params)
        redirect_to party_path(party)
    end
    private

    def order_params
        params.require(:order).permit(:dish_id)
    end
end
