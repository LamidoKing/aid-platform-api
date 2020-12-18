# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all

user1 = User.create(
  first_name: 'lamido',
  last_name: 'tijjani',
  email: 'kinglamido@gmail.com',
  status: 'offline',
  password: 'lamidotijjani'
)
puts(user1.first_name)

user2 = User.create(
  first_name: 'Alex',
  last_name: 'Nicholos',
  email: 'alex@gmail.com',
  status: 'offline',
  password: 'alex'
)
puts(user2.first_name)

user3 = User.create(
  first_name: 'Dan',
  last_name: 'Carlos',
  email: 'dan@gmail.com',
  status: 'offline',
  password: 'dan'
)
puts(user3.first_name)

user4 = User.create(
  first_name: 'Alex',
  last_name: 'Joe',
  email: 'alexjoe@gmail.com',
  status: 'offline',
  password: 'alex'
)
puts(user4.first_name)
