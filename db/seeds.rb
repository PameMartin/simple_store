require "csv"
Product.destroy_all

676.times do
  Product.create(
    title: Faker::Commerce.unique.product_name,

    price: Faker::Commerce.price,

    stock_quantity: Faker::Number.between(from: 1, to: 100)
  )
end

puts "There are now #{Product.count} Products"
