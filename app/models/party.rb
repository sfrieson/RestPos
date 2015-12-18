class Party < ActiveRecord::Base
    has_many :parties
    has_many :orders
    has_many :dishes, through: :orders
    has_many :tables
end
