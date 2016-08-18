namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		# admin = User.create!(name: "Sean Allen", 
		# 						 				 email: "gallonallen@gmail.com",
		# 						         password: "foobar",
		# 						         password_confirmation: "foobar")
		# admin.toggle!(:admin)
		# dummy = User.create!(name: "Sean Allen",
		# 										 email: "gallonallen@yahoo.com",
		# 										 password: "foobar",
		# 										 password_confirmation: "foobar")
		# 99.times do |n|
		# 	name = Faker::Name.name
		# 	email = "example-#{n+1}@example.com"
		# 	password = "password"
		# 	User.create!(name: name,
		# 							 email: email,
		# 							 password: password,
		# 							 password_confirmation: password)
		# end
		# ggb = Site.create!(name: "Golden Gate Bridge",
		# 									tag: "bridge",
		# 									description: "The Golden Gate Bridge is a landmark of San Fransisco.",
		# 									latitude: 37.8188,
		# 									longitude: 122.4784)
		# 99.times do |n|
		# 	name = "Site-#{n+1}"
		# 	tag = "tag"
		# 	description = "This is the description of site #{n+1}"
		# 	latitude = 37
		# 	longitude = 122
		# 	Site.create!(name: name,
		# 							 tag: tag,
		# 							 description: description,
		# 							 latitude: latitude,
		# 							 longitude: longitude)
		# end
		tag = Tag.create!(name: "building")
		tag = Tag.create!(name: "monument")
		tag = Tag.create!(name: "plaque")
		tag = Tag.create!(name: "museum")
		tag = Tag.create!(name: "hill")
		tag = Tag.create!(name: "space")
		tag = Tag.create!(name: "ship")
		tag = Tag.create!(name: "writer")
		tag = Tag.create!(name: "artist")
		tag = Tag.create!(name: "character")
		tag = Tag.create!(name: "worker")
		tag = Tag.create!(name: "leader")
		tag = Tag.create!(name: "immigrant")
		tag = Tag.create!(name: "explorer")
		tag = Tag.create!(name: "restaurant")
		tag = Tag.create!(name: "hotel")
		tag = Tag.create!(name: "event")
		tag = Tag.create!(name: "legend")
		tag = Tag.create!(name: "science")
		tag = Tag.create!(name: "silver")
		tag = Tag.create!(name: "gold")
	end
end
	
