
50.times do
  full_name = Faker::Name.name
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  image = File.open("./app/assets/images/dummy_user.jpg")
  User.create!(full_name: full_name, name: name, email: email, password: password, image: image)
end