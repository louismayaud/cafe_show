# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "cloudinary"

puts "Destroying users and coffees"
User.destroy_all

# puts "fetch public ids from cloudinary"
#
 # pictures = Cloudinary::Api.resources["resources"]
COFFEE_PUBLIC_IDS = [
  "cafe_grainandlabel", "coffee_cup_served", "coffee_filter"
]
AVATAR_PUBLIC_IDS = [
  "avatar_Saunier", "avatar_louism", "avatar_moss"
]
COMPANY_PUBLIC_IDS = [
  "logo_alchimiste", "logo-belleville", "logo_comiteducafe"
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

puts 'creating a common seller'
seller_user = User.new(
  name: Faker::Company.name,
  email: "seller@gmail.com",
  password: '12345678',
  billing_information: rand(1000000000..5000000000),
  address: Faker::Address.full_address,
  introduction: Faker::TvShows::Friends.quote
)
fetch_company_images(seller_user)
seller_user.save!

puts 'Creating sellers'

10.times do
  user = User.new(
    name: Faker::Company.name,
    email: Faker::Internet.email,
    password: '12345678',
    billing_information: rand(1000000000..5000000000),
    address: Faker::Address.full_address,
    introduction: Faker::TvShows::Friends.quote
  )
  fetch_company_images(user)
  user.save!

    puts 'Creating 2 fake coffees for this user'

    2.times do
      coffee = Coffee.new(
        price_per_unit: rand(15..40),
        intensity: rand(0..5),
        machine: ["Bean expresso", "French press", "Filter", "Italian", "Aeropress"].sample,
        flavour: ["Sweet", "Fruity", "Bitter", "Citric"].sample,
        country_origin: Faker::Coffee.origin,
        stock: rand(1..20),
        unit_sold: rand(1..20),
        blend_name: Faker::Coffee.blend_name,
        tree: ["Arabica", "Robusta"].sample,
        description: Faker::Coffee.notes
    )
    coffee.user = user
    fetch_coffee_images(coffee)
    coffee.save!
  end
end

puts 'creating a common buyer'

buyer_user = User.new(
  name: Faker::Company.name,
  email: "buyer@gmail.com",
  password: '12345678',
  billing_information: rand(1000000000..5000000000),
  address: Faker::Address.full_address,
  introduction: Faker::TvShows::Friends.quote
)
fetch_avatar_images(buyer_user)
buyer_user.save!

puts 'Creating 10 buyers'

10.times do
  user = User.new(
    name: Faker::Movies::Lebowski.character,
    email: Faker::Internet.email,
    password: '12345678',
    billing_information: rand(1000000000..5000000000),
    address: Faker::Address.full_address,
    introduction: Faker::TvShows::Friends.quote,
  )
  fetch_avatar_images(user)
  user.save!
end

puts 'Finished!'
