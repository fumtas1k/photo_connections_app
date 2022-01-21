n = 50
names = Array.new(n) { Faker::Games::Pokemon.unique.name }
emails = Array.new(n) { Faker::Internet.unique.email }
n.times do |i|
  full_name = Faker::Name.name
  name = names[i]
  email = emails[i]
  password = "password"
  image = File.open("./app/assets/images/dummy_user.jpg")
  User.create!(full_name: full_name, name: name, email: email, password: password, image: image)
end