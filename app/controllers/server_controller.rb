class ServerController < ApplicationController
    def index
        @tabletops = Tabletop.all.sort
        @seated = restaurant.seated
    end
end
