class Reservation < ActiveRecord::Base
	belongs_to :restaurant

	validates :email, 					:presence => {:message => "Must have email for reservation."}, :email_format => true
	validates :requested_date_time, 	:presence => {:message => "Please stay at the 4th dimension."}
	validates :restaurant_association, 	:presence => {:message => "Reservation must be for a restaurant."}
end