class PartiesController < ApplicationController
    def new
        @party = Party.create
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

        redirect_to root_path
    end
    def destroy
        party = Party.find(params[:id])
        restaurant.clear(party)
        Party.destroy(party)
        redirect_to root_path
    end


    private

    def party_params
     params.require(:party).permit(tabletops_attributes: [ :id ])
   end
end
