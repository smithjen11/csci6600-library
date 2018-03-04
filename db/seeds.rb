# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
	Book.create(title: 'book'+n.to_s, author_last_name: 'Smith', author_first_name: 'John'+n.to_s, isbn: n, 
		publish_year: Time.new.year-n, language: 'English', length: n*25, material_type: 'book', 
		image_url: Rails.root+'/th.jpeg', genre: 'fiction', reading_level: 'young adult', subject: 'dogs')
end

5.times do |n|
	User.create(email: "person#{n}@example.com", password: 'password'+n.to_s, password_confirmation: 'password'+n.to_s, admin: n.odd?)
end

