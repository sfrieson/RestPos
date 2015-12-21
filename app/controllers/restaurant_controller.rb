class RestaurantController < ApplicationController
    def login
    end
    def show
        @tabletops = Tabletop.all.sort #make sure tables are in order for showing
        @parties = Party.all
        @orders = Order.where(status: "cooking")
    end
    def clean
        table = Tabletop.find(params[:format])
        table.status = "clean"
        table.save
        redirect_to root_path
    end
    def host
        #moved to Host#index
    end
    def server
        #moved to Server#index
    end
    def kitchen
        #moved to Kitchen#index
    end
end
