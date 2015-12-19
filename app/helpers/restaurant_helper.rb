module RestaurantHelper
    def restaurant
        @rest = @rest || Restaurant.new
    end

    class Restaurant
        def initialize
            @name = "Gadoe's"
        end
        attr_reader :name
        def unseated
            Party.all.reject { |party| party.tabletops.length > 0}
        end
        def vacant
            Tabletop.where(occupied: false)
        end
        def clear(party)
            party.tabletops.each do |t|
                t.party = nil
                t.status = "Dirty"
                t.occupied = false
                t.save
            end
        end
    end
end
