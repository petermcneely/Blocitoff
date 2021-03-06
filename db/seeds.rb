# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Generate some users.
5.times do
	User.create(
		email: Faker::Internet.email,
		password: Faker::Internet.password
		)
end

users = User.all

60.times do
	Item.create(
		name: Faker::Lorem::sentence,
		user: users.sample,
		created_at: Time.now
		)
end