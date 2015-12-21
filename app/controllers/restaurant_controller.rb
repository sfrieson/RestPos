class RestaurantController < ApplicationController
    def login
    end
    def show
        @tabletops = Tabletop.all.sort #make sure tables are in order for showing
        @parties = Party.all
        @orders = Order.all
    end
    def clean
        table = Tabletop.find(params[:format])
        table.status = "clean"
        table.save for showing
        redirect_to root_path
    end
end
