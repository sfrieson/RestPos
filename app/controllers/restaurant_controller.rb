class RestaurantController < ApplicationController
    def login
    end
    def show
        @tabletops = Tabletop.all.sort
        @parties = Party.all
        @orders = Order.all
    end
end
