require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RestaurantHelper. For example:
#
# describe RestaurantHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RestaurantHelper, type: :helper do
  describe "when given value in cents" do
      it "converts to a string with two decimal places, commas, and dollar sign " do
          num = 123400
          actual = restaurant.get_currency(num)
          desired = "$1,234.00"

          expect(actual).to eq(desired)
      end
      it "multiplies by exhange rate, converts to a string with spaces, comma, and euro symbol " do
          num = 123400
          actual = restaurant.get_currency(num, "euro")
          desired = "1 126,52 €"

          expect(actual).to eq(desired)
      end
  end
end
