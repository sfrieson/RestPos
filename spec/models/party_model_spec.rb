require "rails_helper"
include RestaurantHelper

RSpec.describe Party, :type => :model do
  describe "When a new party comes in" do
      before do
          Party.create
      end
      describe "and is not yet seated" do
          it "is found on a list by calling restaurant.waitlist" do
              other_party = Party.create()
              Tabletop.create({party: other_party})

              actual = restaurant.waitlist.length
              desired = 1
              expect(actual).to eq(desired)
          end
      end
  end
end
