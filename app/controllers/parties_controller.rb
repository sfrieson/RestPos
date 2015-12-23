class PartiesController < ApplicationController
    def new
        @party = Party.create
        @tabletops = Tabletop.all.sort
        #makes a tabletop model for the number of tables they need
        (@party.tabletops_needed).times {@party.tabletops.build}
    end

    def edit
        @party = Party.find(params[:id])
        @tabletops = Tabletop.all.sort
        (@party.tabletops_needed).times {@party.tabletops.build}
    end

    def update
        party = Party.find(params[:id])

        party_params[:tabletops_attributes].values.each do |target|
            table = Tabletop.find(target[:id])
            table.party = party
            table.occupied = true
            table.save
        end

        redirect_to host_index_path
    end

    def destroy
        party = Party.find(params[:id])
        restaurant.clear(party)
        Party.destroy(party)
        redirect_to server_index_path
    end


    def show
        @party = Party.find(params[:id])
        @order = Order.new
    end

    def receipt
        @party = Party.find(params[:party_id])
        party_dishes = restaurant.itemize(@party.dishes)
        party_total = restaurant.total(@party.orders, @party.currency)
        @receipt = { :orders => party_dishes, :total => party_total }
    end

    private

    def party_params
     params.require(:party).permit(tabletops_attributes: [:id])
   end

end
