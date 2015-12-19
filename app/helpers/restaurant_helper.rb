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
    end
end
