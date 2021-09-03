# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

1000.times do
    Sale.create!(
        amount: rand(1..100),
        price: rand(1990..5490),
        blend_coffee: Faker::Coffee.blend_name,
        origin: Faker::Coffee.origin,
        sale_date: Faker::Date.between(from: Date.new(2019,1,1), to: Date.today)
    )
end
