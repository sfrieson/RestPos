class HostController < ApplicationController
    def index
        @tabletops = Tabletop.all.sort
        @waitlist = restaurant.waitlist
    end
    def destroy
        party = Party.find(params[:id])
        restaurant.clear(party)
        Party.destroy(party)
        redirect_to host_index_path
    end
end
