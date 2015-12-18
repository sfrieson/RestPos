class Party < ActiveRecord::Base
    has_many :guests
    has_many :orders
    has_many :dishes, through: :orders
    has_many :tabletops
end
