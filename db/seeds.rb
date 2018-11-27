# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# require "cloudinary"

puts "Destroying users and coffees"
User.destroy_all

# puts "fetch public ids from cloudinary"
#
 # pictures = Cloudinary::Api.resources["resources"]
# PUBLIC_IDS = pictures.pluck(:public_id)

# def fetch_cloudinary_images(instance)
# resource = Cloudinary::Api.resource(PUBLIC_IDS.sample)
# resource_type = resource["resource_type"]
# type = resource["type"]
# public_id = resource["public_id"]
# version = resource["version"]
# format = resource["format"]
# signature = Cloudinary::Utils.api_sign_request({public_id: public_id, version: version}, Cloudinary.config.api_secret)
# image = "#{resource_type}/#{type}/v#{version}/#{public_id}.#{format}##{signature}"

# instance.picture = image
# end

puts 'Creating sellers'

10.times do
  user = User.new(
    name: Faker::Company.name,
    email: Faker::Internet.email,
    password: '12345678',
    billing_information: rand(1000000000..5000000000),
    address: Faker::Address.full_address,
    introduction: Faker::TvShows::Friends.quote
    # avatar:
  )
# fetch_cloudinary_images(user)
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

    # fetch_cloudinary_images(coffee)
    coffee.save!
  end
end

puts 'Creating 10 buyers'

10.times do
  user = User.new(
    name: Faker::Movies::Lebowski.character,
    email: Faker::Internet.email,
    password: '12345678',
    billing_information: rand(1000000000..5000000000),
    address: Faker::Address.full_address,
    introduction: Faker::TvShows::Friends.quote,
    # avatar:
  )
  # fetch_cloudinary_images(user)
  user.save!
end

puts 'Finished!'

