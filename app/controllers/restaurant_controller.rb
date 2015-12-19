class RestaurantController < ApplicationController
    def login
    end
    def show
        @tabletops = Tabletop.all
        @parties = Party.all
        @orders = Order.all
    end
end
