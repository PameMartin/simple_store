require "csv"
Product.destroy_all
Category.destroy_all

filename = Rails.root.join('db/products.csv')
csv_data = File.read(filename)

products = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

# 676.times do
#   Product.create(
#     title: Faker::Commerce.unique.product_name,

#     price: Faker::Commerce.price,

#     stock_quantity: Faker::Number.between(from: 1, to: 100)
#   )
# end
products.each do |product|
  category = Category.find_or_create_by(name: product["category"])
  if category && category.valid?
    new_product = category.product.create(
      name: product["name"],
      price: product["price"],
      description: product["description"],
      stock_quantity: product["stock quantity"]
    )
    unless new_product && new_product.valid?
      puts "Failed to create the movie #{product["name"]}"
            next
    end
  else
    puts "Something is wrong creating this category:
        #{product["category"]} for the product #{product["name"]}"
  end
end

puts "Create #{Category.count} categories."
puts "Create #{Product.count} Products"
