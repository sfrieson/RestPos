class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :party
  belongs_to :dish
end
