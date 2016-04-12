# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
(1..5).each do |i|
	users << User.create(	email: "user#{i}@gmail.com",
							password: 'password',
							name:  "user#{i}",
							role: 'owner' )
end


restaurants = []
(1..5).each do |i|
	restaurants << Restaurant.create(	:name => "user#{i}'s restaurant",
					     				:description => "Fast Food",
					         			:address => "Naperville",
					    				:phone_number => "223-456-789#{i}")
end


categories = ["Fast Food", "Home Cooking", "High End", "Breakfast", "Franchise"]
categories_description = ["Americans should start ordering in smaller protion", "Go whenever feeling lazy to cook", "Only for significant other", "Hot on Sundays", "Buy someone else's hardwork"]
(0..4).each do |i|
	categories << Category.create(	:name => categories[i],
					     			:description => categories_description[i])
end

users.each_with_index do |user, index|
	user.restaurants << restaurants[index]
end