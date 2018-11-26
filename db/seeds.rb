# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creating 100 fake coffees'
50.times do
  coffee = Coffee.new(
    price_per_unit: rand(15.0..40.0)
    intensity: rand(0..5)
    machine: ["Bean expresso", "French press", "Filter", "Italian", "Aeropress"].sample(1)
    flavour: ["Sweet", "Fruity", "Bitter", "Citric"].sample(1)
    country_origin: Faker::Coffee.origin
    stock: rand(1..20)
    unit_sold: rand (1..20)
    picture:
    blend_name: Faker::Coffee.blend_name
    tree: ["Arabica", "Robusta"].sample(1)
    description: Faker::Coffee.notes
  )
  coffee.save!
end
puts 'Finished!'
