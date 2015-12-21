module RestaurantHelper
    def restaurant
        @rest = @rest || Restaurant.new
    end

    class Restaurant
        def initialize
            @name = "Gadoe's"
            @address = "1021 Church Ave, Brooklyn, NY 11218"
            @phone = "(929) 234-5692"
            @website = "gadoesnyc.com"
        end
        attr_reader :name, :address, :phone, :website

        def clear(party)
            party.tabletops.each do |t|
                t.status = "dirty"
                t.occupied = false
                t.save
            end
        end
        def itemize(dishes)
            dishes.uniq.map do |dish|
                {
                    name: dish.name,
                    qty: dishes.to_a.count(dish),
                    price: dish.price,
                    qty_price: dish.price * dishes.to_a.count(dish)
                }
            end
        end

        def seated
            Party.all.reject { |party| party.tabletops.length == 0 }
        end

        def total(orders)
            @subtotal = 0
            orders.each { |order| @subtotal += order.dish.price }

            @tax = (@subtotal * 0.08875).round
            @grand = @subtotal + @tax

            #Suggested tip string
            @tip = "15% = $#{(@subtotal * 0.15).round.to_f/100},
            20% = $#{(@subtotal * 0.20).round.to_f/100},
            25% = $#{(@subtotal * 0.25).round.to_f/100}"

            {
                :subtotal => @subtotal.to_f/100,
                :tax => @tax.to_f/100,
                :grand => @grand.to_f/100,
                :tip => @tip
            }
        end

        # def unseated
        #     Party.all.reject { |party| party.tabletops.length > 0 }
        # end

        def vacant
            arr = Tabletop.where(occupied: false, status: "clean").sort
            arr.map { |t| t.id.to_i }
        end
        def waitlist
            Party.all.reject { |party| party.tabletops.length > 0 }
        end
    end
end
