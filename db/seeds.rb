# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destoying everything"

User.destroy_all
puts "creating admin user..."
puts "creating spaceships..."
user_admin = User.create!(
    first_name: "Lola",
    last_name: "lalal",
    email: "lola@gmail.com",
    password: "12345678",
    admin: true
  )

user_gaia = User.create(
    first_name: "Gaia",
    last_name: "Cravesana",
    email: "gcrave@gmail.com",
    password: "lalaland",
    admin: false
)

Spaceship.create(name: "Moon Light", destination: "moon", price: 8000, user_id:user_admin.id )
Spaceship.create(name: "MarsX the red planet", destination: "mars", price: 70000, user_id:user_admin.id )
Spaceship.create(name: "The smallest sun", destination: "mercury", price: 85000, user_id:user_admin.id )
Spaceship.create(name: "Lover", destination: "venus", price: 50000, user_id:user_admin.id )
Spaceship.create(name: "The ring", destination: "saturn", price: 90000, user_id:user_admin.id )
Spaceship.create(name: "Far out", destination: "neptune", price: 100000, user_id:user_admin.id )
Spaceship.create(name: "The 7th planet", destination: "uranus", price: 200000, user_id:user_admin.id )
