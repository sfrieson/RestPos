class Party < ActiveRecord::Base
    has_many :guests
    has_many :orders, dependent: :destroy
    has_many :dishes, through: :orders
    has_many :tabletops, dependent: :nullify #takes party_id off table but doesn't delete table
    accepts_nested_attributes_for :tabletops #allows more than one table to be set at a time for multi-table parties

    after_initialize :init
    def init
        self.reservation = self.reservation || Faker::Name.last_name
        self.size = self.size || rand(1..8)
        self.currency = self.currency || rand(1..4) == 1 ? "euro" : "usd" #25% chance they use euro
        self.save
    end

    def tabletops_needed
        (self.size/2.to_f).ceil
    end
end
