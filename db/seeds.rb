# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_emails = ["adam@gmail.com", "betty@gmail.com", "chuck@gmail.com", "dave@gmail.com", "eva@gmail.com"]
user_passwords = []
user_names = ["adam", "betty", "chuck", "dave", "eva"]
user_roles = []
users = []
(0..4).each do |i|
	users << User.create(	email: user_emails[i],
							password: 'password',
							name:  user_names[i],
							role: 'owner' )
end

categories = ["Fast Food", "Home Cooking", "High End", "Breakfast", "Franchise"]
categories_description = ["Americans should start ordering in smaller protion", "Go whenever feeling lazy to cook", "Only for significant other", "Hot on Sundays", "Buy someone else's hardwork"]
(0..4).each do |i|
	categories << Category.create(	:name => categories[i],
					     			:description => categories_description[i])
end

restaurant_names = ["Best hot dog", "Betty's home kitchen", "The C Bar", "Good old BBQ", "European Delicious"]
restaurant_descriptions = ["Fast and HOT", "You will feel like home", "Friday night happy hour", "Special sauce", "Taste of Italy and Germany"]
restaurant_addresses = ["123 Milwakee ave. Chicago, IL", "333 main st. Joliet, IL", "534 Geneva st. Aurora, IL", "900 main st. Arlington Heights, IL", "345 north st. Northbrook, IL"]
restaurant_phone_numbers = ["235-457-5689", "546-487-5574", "658-457-8955", "356-894-7848", "457-458-4895"]
restaurant_category_ids = [1, 2, 5, 4, 3]
restaurants = []
(0..4).each do |i|
	restaurants << Restaurant.create(	:name => restaurant_names[i],
					     				:description => restaurant_descriptions[i],
					         			:address => restaurant_addresses[i],
					    				:phone_number => restaurant_phone_numbers[i],
					    				:category_ids => restaurant_category_ids[i])
end

users.each_with_index do |user, index|
	user.restaurants << restaurants[index]
end