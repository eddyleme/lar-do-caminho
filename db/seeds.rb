# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.destroy_all
Admin.create(email: "a@b.co", password: "asdf")

Album.destroy_all
Photo.destroy_all
Album.create(album_title:"halloween party", photo_count: 1, cover_photo: "/app/assets/jkl.jpg")
Photo.create(album_id: 1, caption: "John smith at the halloween party", photo_location: "/app/assets/001.jpg")

Event.destroy_all
Package.destroy_all
Ticket.destroy_all
Event.create(name: "Halloween Party", description: "Costume Party", date: "October, 31, 2018", display_photo: "/app/assets/asdf.jpg")
Package.create(name: "Gold", description: "free drinks and a table", price: 500, event_id: 1)
Ticket.create(name: "John Smith", email: "john@thesmiths.com", amount_paid: 500, package_id: 1)

puts 'database has been seeded'
