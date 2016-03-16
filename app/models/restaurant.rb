class Restaurant < ActiveRecord::Base
	has_many :RestaurantOwners
	has_many :Users, through: :RestaurantOwners
end
