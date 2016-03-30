class Restaurant < ActiveRecord::Base
	has_many :restaurants_users
	has_many :users, through: :restaurants_users
	has_many :reservations
	has_many :starrings

	validates :name, 			:presence => {:message => "Dude! The Restaurant must have a name!"}
	validates :address, 		:presence => {:message => "The Restaurant must physically exist."}
	validates :phone_number, 	:presence => {:message => "The Restaurant must have a contact phone number."},	:check_phone_number => true
end
