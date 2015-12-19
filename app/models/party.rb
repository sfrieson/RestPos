class Party < ActiveRecord::Base
    has_many :guests
    has_many :orders
    has_many :dishes, through: :orders
    has_many :tabletops
    
    after_initialize :init
    def init
        self.reservation = self.reservation || Faker::Name.last_name
        self.size = self.size || rand(1..8)
    end
end
