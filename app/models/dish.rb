class Dish < ActiveRecord::Base
    has_many :orders
    has_many :parties, through: :orders
    has_many :guests, through: :parties
    has_many :users, through: :orders
    has_many :tabletops, through: :users


    def courses
        ['Appetizers', 'Sides', 'Soups & Salads', 'Main Entrées', 'Desserts', 'Drinks']
    end
end
