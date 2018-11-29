# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "cloudinary"
require 'awesome_print'
puts "Destroying users and coffees"

Purchase.destroy_all
User.destroy_all
# puts "fetch public ids from cloudinary"
#
 # pictures = Cloudinary::Api.resources["resources"]
COFFEE_PUBLIC_IDS = [
  "coffee_cup3", "coffee_cup2", "coffee_cup4"
]
AVATAR_PUBLIC_IDS = [
  "avatar_Saunier", "avatar_louism", "avatar_moss"
]
COMPANY_PUBLIC_IDS = [
  "logo_alchimiste", "logo-belleville", "logo_comiteducafe"
]

URL = [
  "https://media.istockphoto.com/photos/coffee-bean-picture-id466732980?k=6&m=466732980&s=612x612&w=0&h=7NyhAw5KS3EJECcJPOHgSqZffX2RFCAU_92ydPr8iZU=",
  "https://cpb-us-w2.wpmucdn.com/u.osu.edu/dist/e/13119/files/2015/04/Coffeebeanz-txuhmf.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6f_T2lY0zKDRIBBlChMRhoJxrY9nsVwBkGkC8txotYwidda8p",
]

def fetch_coffee_images(coffee)
  resource = Cloudinary::Api.resource(COFFEE_PUBLIC_IDS.sample)
  public_id = resource["public_id"]
  version = resource["version"]
  format = resource["format"]
  image = "v#{version}/#{public_id}.#{format}"
  coffee.picture = image

end

def fetch_avatar_images(user)
  resource = Cloudinary::Api.resource(AVATAR_PUBLIC_IDS.sample)
  public_id = resource["public_id"]
  version = resource["version"]
  format = resource["format"]
  image = "v#{version}/#{public_id}.#{format}"
  user.avatar = image
end

def fetch_company_images(user)
  resource = Cloudinary::Api.resource(COMPANY_PUBLIC_IDS.sample)
  public_id = resource["public_id"]
  version = resource["version"]
  format = resource["format"]
  image = "v#{version}/#{public_id}.#{format}"
  user.avatar = image
end

puts "create a seller rodrigue"
rodrigue = User.new(
  name: "Rodrigue",
  email: "rodrigue@gmail.com",
  password: '12345678',
  billing_information: rand(1000000000..5000000000),
  address: "1 rue Rodrigue, 75011 Paris",
  introduction: "Coucou je m'appelle Rodrigue et j'aime vendre du café"
)
fetch_company_images(rodrigue)
rodrigue.save!

puts 'Creating 10 fake coffees from rodrigue'

10.times do
  coffee = Coffee.new(
    price_per_unit: rand(15..40),
    intensity: ["morning", "noon", "night"].sample,
    machine: ["Bean expresso", "French press", "Filter", "Italian", "Aeropress"].sample,
    flavour: ["Sweet", "Fruity", "Bitter", "Citric"].sample,
    provenance: Faker::Coffee.origin,
    stock: rand(1..20),
    unit_sold: rand(1..20),
    blend_name: Faker::Coffee.blend_name,
    tree: ["Arabica", "Robusta"].sample,
    description: Faker::Coffee.notes
)
  coffee.user = rodrigue
  coffee.remote_picture_url = URL.sample
  # fetch_coffee_images(coffee)r
  coffee.save
end

puts "create a seller Louis"
louis = User.new(
  name: "Louis",
  email: "louis@gmail.com",
  password: '12345678',
  billing_information: rand(1000000000..5000000000),
  address: "1 rue Louis, 75011 Paris",
  introduction: "Coucou je m'appelle Louis et le café c'est toute ma vie"
)
fetch_company_images(louis)
louis.save!

puts 'Creating 10 fake coffees from Louis'

10.times do
  coffee = Coffee.new(
    price_per_unit: rand(15..40),
    intensity: ["morning", "noon", "night"].sample,
    machine: ["Bean expresso", "French press", "Filter", "Italian", "Aeropress"].sample,
    flavour: ["Sweet", "Fruity", "Bitter", "Citric"].sample,
    provenance: Faker::Coffee.origin,
    stock: rand(1..20),
    unit_sold: rand(1..20),
    blend_name: Faker::Coffee.blend_name,
    tree: ["Arabica", "Robusta"].sample,
    description: Faker::Coffee.notes
)
  coffee.user = louis
  coffee.remote_picture_url = URL.sample
  # fetch_coffee_images(coffee)
  coffee.save
end

puts "create a buyer Sacha"
sacha = User.new(
  name: "Sacha",
  email: "sacha@gmail.com",
  password: '12345678',
  billing_information: rand(1000000000..5000000000),
  address: "1 rue Sacha, 75011 Paris",
  introduction: "Coucou je m'appelle Sacha et le café le matin me donne la forme"
)
fetch_avatar_images(sacha)
sacha.save!

puts "create a buyer Thibaut"
thibaut = User.new(
  name: "Thibaut",
  email: "thibaut@gmail.com",
  password: '12345678',
  billing_information: rand(1000000000..5000000000),
  address: "1 rue Thibaut, 75011 Paris",
  introduction: "Coucou je m'appelle Thibaut et je n'aime pas le café mais ce site est sympa"
)
fetch_avatar_images(thibaut)
thibaut.save!

puts "creating two purchases from Thibaut"
purchase1 = Purchase.new(coffee: Coffee.all.first, user: thibaut, quantity: 3)
purchase1.save
purchase2 = Purchase.new(coffee: Coffee.all.last, user: thibaut, quantity: 1)
purchase2.save

puts "creating two purchases from Sacha"
purchase3 = Purchase.new(coffee: Coffee.all.first, user: sacha, quantity: 2)
purchase3.save
purchase4 = Purchase.new(coffee: Coffee.all.last, user: sacha, quantity: 10)
purchase4.save


# puts 'creating a common seller'
# seller_user = User.new(
#   name: Faker::Company.name,
#   email: "seller@gmail.com",
#   password: '12345678',
#   billing_information: rand(1000000000..5000000000),
#   address: Faker::Address.full_address,
#   introduction: Faker::TvShows::Friends.quote
# )
# fetch_company_images(seller_user)
# seller_user.save!

# puts 'Creating sellers'

# 10.times do
#   user = User.new(
#     name: Faker::Company.name,
#     email: Faker::Internet.email,
#     password: '12345678',
#     billing_information: rand(1000000000..5000000000),
#     address: Faker::Address.full_address,
#     introduction: Faker::TvShows::Friends.quote
#   )
#   fetch_company_images(user)
#   ap user
#   user.save!

#     puts 'Creating 2 fake coffees for this user'

#     2.times do
#       coffee = Coffee.new(
#         price_per_unit: rand(15..40),
#         intensity: rand(0..5),
#         machine: ["Bean expresso", "French press", "Filter", "Italian", "Aeropress"].sample,
#         flavour: ["Sweet", "Fruity", "Bitter", "Citric"].sample,
#         provenance: Faker::Coffee.origin,
#         stock: rand(1..20),
#         unit_sold: rand(1..20),
#         blend_name: Faker::Coffee.blend_name,
#         tree: ["Arabica", "Robusta"].sample,
#         description: Faker::Coffee.notes
#     )
#     coffee.user = user
#     fetch_coffee_images(coffee)
#     ap coffee
#     coffee.save!
#   end
# end

# puts 'creating a common buyer'

# buyer_user = User.new(
#   name: Faker::Company.name,
#   email: "buyer@gmail.com",
#   password: '12345678',
#   billing_information: rand(1000000000..5000000000),
#   address: Faker::Address.full_address,
#   introduction: Faker::TvShows::Friends.quote
# )
# fetch_avatar_images(buyer_user)
# buyer_user.save!

# puts 'Creating 10 buyers'

# 10.times do
#   user = User.new(
#     name: Faker::Movies::Lebowski.character,
#     email: Faker::Internet.email,
#     password: '12345678',
#     billing_information: rand(1000000000..5000000000),
#     address: Faker::Address.full_address,
#     introduction: Faker::TvShows::Friends.quote,
#   )
#   fetch_avatar_images(user)
#   user.save!
# end

puts 'Finished!'
