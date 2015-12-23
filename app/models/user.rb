class User < ActiveRecord::Base
    has_many :tabletops
    has_many :parties, through: :tabletops
    has_many :guests, through: :parties
    has_many :orders
    has_many :dishes, through: :orders
    has_many :parties, through: :orders
    has_many :guests, through: :parties


    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
    validates :first_name, presence: true
    validates :last_name, presence: true
    def positions
        ["Waiter", "Busser", "Chef", "Manager", "Asst. Manager"]
    end
end
