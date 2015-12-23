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

        def get_currency(num, currency = "usd")
            av = ActionView::Base.new

            if currency == "euro"
                num = num.to_f * 0.9129
                num = num.round(2)
                num = num/100
                return (av.number_to_currency num, unit: "€", separator: ",", delimiter: " ", format: "%n %u").to_s
            else
                num = num.to_f/100
                return (av.number_to_currency num).to_s
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

        def total(orders, currency)
            @subtotal = 0
            orders.each { |order| @subtotal += order.dish.price }

            @tax = (@subtotal * 0.08875).round
            @grand = @subtotal + @tax

            #Suggested tip string
            @tip = "15% = #{self.get_currency (@subtotal * 0.15), currency},
            20% = #{self.get_currency (@subtotal * 0.20), currency},
            25% = #{self.get_currency (@subtotal * 0.25), currency}"

            {
                :subtotal => @subtotal,
                :tax => @tax,
                :grand => @grand,
                :tip => @tip
            }
        end

        def vacant
            arr = Tabletop.where(occupied: false, status: "clean").sort
            arr.map { |t| t.id.to_i }
        end
        def waitlist
            Party.all.reject { |party| party.tabletops.length > 0 }
        end
    end
end
