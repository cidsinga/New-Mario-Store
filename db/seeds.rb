# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all

50.times do |index|
  products = []
  products.push(Product.create!(prod_name: Faker::Superhero.name, cost: Faker::Number.between(from: 1, to: 30), country_of_origin: Faker::Address.country_name_to_code))
  products
  rand(10..50).times do |review|
    products.each do |product|
    Review.create! :author => Faker::Name.name,
                   :content_body => Faker::Lorem.paragraph_by_chars(number:51, supplemental: false),
                   :rating => Faker::Number.between(from: 1, to: 5),
                   :product_id => product.id
    end
  end
end

p "Created #{Product.count} products"
