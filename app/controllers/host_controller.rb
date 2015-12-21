class HostController < ApplicationController
    def index
        @tabletops = Tabletop.all.sort
        @waitlist = restaurant.waitlist
    end
end
