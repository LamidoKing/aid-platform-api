# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Volunter.delete_all
Message.delete_all
Request.delete_all
User.delete_all
ActiveStorage::Attachment.all.each(&:purge)

user1 = User.create(
  first_name: 'lamido',
  last_name: 'tijjani',
  email: 'kinglamido@gmail.com',
  status: 'offline',
  password: 'lamidotijjani'
)
user1.govnt_id.attach(io: File.open(Rails.root.join('seedFiles/govnt_id.pdf')), filename: 'govnt_id.pdf', content_type: 'application/pdf')
puts(user1.first_name)

user2 = User.create(
  first_name: 'Alex',
  last_name: 'Nicholos',
  email: 'alex@gmail.com',
  status: 'offline',
  password: 'alex'
)
user2.govnt_id.attach(io: File.open(Rails.root.join('seedFiles/govnt_id.png')), filename: 'govnt_id.png', content_type: 'image/png')
puts(user2.first_name)

user3 = User.create(
  first_name: 'Dan',
  last_name: 'Carlos',
  email: 'dan@gmail.com',
  status: 'offline',
  password: 'dan'
)
user3.govnt_id.attach(io: File.open(Rails.root.join('seedFiles/govnt_id.jpg')), filename: 'govnt_id.jpg', content_type: 'image/jpg')
puts(user3.first_name)

user4 = User.create(
  first_name: 'Alex',
  last_name: 'Joe',
  email: 'alexjoe@gmail.com',
  status: 'offline',
  password: 'alex'
)
user4.govnt_id.attach(io: File.open(Rails.root.join('seedFiles/govnt_id.png')), filename: 'govnt_id.png', content_type: 'image/png')
puts(user4.first_name)

request1 = Request.create(
  user_id: user1.id,
  title: 'First Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'One Time Request',
  latitude: 9.074766556343297,
  longitude: 8.545882459436788,
  status: 'Unfulfill'
)
puts(request1.title)

request2 = Request.create(
  user_id: user1.id,
  title: 'Second Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'Material Need',
  latitude: 9.012380450912666,
  longitude: 8.860366102014913,
  status: 'Unfulfill'
)
puts(request2.title)

request3 = Request.create(
  user_id: user1.id,
  title: 'Third Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'One Time Request',
  latitude: 8.97440101933421,
  longitude: 8.335768934046163,
  status: 'Fulfilled'
)
puts(request3.title)

request4 = Request.create(
  user_id: user1.id,
  title: 'Fouth Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'Material Need',
  latitude: 9.190016633634391,
  longitude: 8.666732068811788,
  status: 'Fulfilled'
)
puts(request4.title)

request5 = Request.create(
  user_id: user1.id,
  title: 'firth Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'Material Need',
  latitude: 9.00152959143697,
  longitude: 8.653456894387736,
  status: 'Unfulfill'
)
puts(request5.title)

request6 = Request.create(
  user_id: user1.id,
  title: 'sixth Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'One Time Request',
  latitude: 9.188298363717408,
  longitude: 8.912725220419947,
  status: 'Unfulfill'
)
puts(request6.title)

request7 = Request.create(
  user_id: user1.id,
  title: 'seventh Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'Material Need',
  latitude: 9.518925647936346,
  longitude: 8.692998657919947,
  status: 'Unfulfill'
)
puts(request7.title)

request8 = Request.create(
  user_id: user2.id,
  title: 'Eighth Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'One Time Request',
  latitude: 9.486039399553169,
  longitude: 8.1900684830596,
  status: 'Unfulfill'
)
puts(request8.title)

request9 = Request.create(
  user_id: user2.id,
  title: 'nineth Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'Material Need',
  latitude: 9.02926961315038,
  longitude: 7.9827015397002254,
  status: 'Unfulfill'
)
puts(request9.title)

request10 = Request.create(
  user_id: user2.id,
  title: 'teenth Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'One Time Request',
  latitude: 9.397984827926342,
  longitude: 8.361729860012725,
  status: 'Fulfilled'
)
puts(request10.title)

request11 = Request.create(
  user_id: user2.id,
  title: 'eleventh Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'Material Need',
  latitude: 8.94016780253069,
  longitude: 8.767359647230156,
  status: 'Fulfilled'
)
puts(request11.title)

request12 = Request.create(
  user_id: user2.id,
  title: 'twelveth Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'Material Need',
  latitude: 9.173428854864788,
  longitude: 8.174097928480156,
  status: 'Unfulfill'
)
puts(request12.title)

request13 = Request.create(
  user_id: user2.id,
  title: 'thirdteenth Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'One Time Request',
  latitude: 9.26560627785781,
  longitude: 8.668482694105156,
  status: 'Unfulfill'
)
puts(request13.title)

request14 = Request.create(
  user_id: user2.id,
  title: 'fourteenth Request',
  description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cill',
  type_of_request: 'Material Need',
  latitude: 9.449888332405278,
  longitude: 7.575343045667657,
  status: 'Unfulfill'
)
puts(request14.title)

volunter1 = Volunter.create!(
  request_id: request1.id,
  user_id: user2.id
)
puts("volunter #{volunter1.id} Success")

volunter2 = Volunter.create!(
  request_id: request1.id,
  user_id: user3.id
)
puts("volunter #{volunter2.id} Success")

message1 = Message.create!(
  sender_id: user2.id,
  receiver_id: user1.id,
  request_id: request1.id,
  message: 'hello'
)

puts(message1.message)

message2 = Message.create!(
  sender_id: user1.id,
  receiver_id: user2.id,
  request_id: request1.id,
  message: 'hi'
)

puts(message2.message)

message3 = Message.create!(
  sender_id: user3.id,
  receiver_id: user1.id,
  request_id: request1.id,
  message: 'hello'
)

puts(message3.message)
