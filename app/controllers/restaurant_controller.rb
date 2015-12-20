class RestaurantController < ApplicationController
    def login
    end
    def show
        @tabletops = Tabletop.all.sort
        @parties = Party.all
        @orders = Order.all
    end
    def clean
        table = Tabletop.find(params[:format])
        table.status = "clean"
        table.save
        redirect_to root_path
    end
end
