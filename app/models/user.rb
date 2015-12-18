class User < ActiveRecord::Base
    has_many :tabletops
    has_many :parties, through: :tabletops
    has_many :guests, through: :parties
    has_many :orders
    has_many :dishes, through: :orders
    has_many :parties, through: :orders
    has_many :guests, through: :parties
    has_secure_password

    def positions
        ["Manager", "Waiter"]
    end
end
