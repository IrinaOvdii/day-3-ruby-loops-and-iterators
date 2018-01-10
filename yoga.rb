@shopping_cart = []
@products = [
  {r_number: 111, name: "Mat Blue", price: 20},
  {r_number: 111, name: "Mat Green", price: 20},
  {r_number: 112, name: "Block", price: 15},
  {r_number: 113, name: "Yoga Tea", price: 20},
  {r_number: 114, name: "Book about Yoga", price: 20},
]

def welcome
  puts "Hello! \nThis is our products:"
  @products.each do |product|
    puts "Reference number: #{product[:r_number]}"
    puts "Product name: #{product[:name]}"
    puts "Product price: #{product[:price] }"
  end
end

def select
  puts "Please select what you wont to buy and put a reference number: "
  gets.chomp.to_i
end

def add_to_cart(r_number)
  product = look_for_product(r_number)
  if product != nil
    @shopping_cart << product
    puts "Thank you for ordering #{product[:name]}. It's in your cart!"
  else
    puts "Reference number is not correct!"
  end
end

def look_for_product(r_number)
  @products.each do |product|
    if product[:r_number] == r_number.to_i
      return product
    end
  end
end

def print_cart
  puts "It's your shopping cart"

  total_price = 0
  @shopping_cart.each do |product|
    puts "Reference number: #{product[:r_number]}"
    puts "Product name: #{product[:name]}"
    puts "Product price: #{product[:price] }"

    total_price = total_price + product[:price]
   end

puts "TOTAL PRICE IS: #{total_price} $"

@shopping_cart   #Why we write here @shopping_cart????????
end

def continue
  puts "Do you want somthing more?"
  answer = gets.chomp.upcase
  answer == "Y"
end

loop do
  puts "You are welcome to the Shop!"
  welcome
  product_r_n = select
  add_to_cart(product_r_n)
  print_cart

  continue_shopping = continue
  break unless continue_shopping
end

puts "Thank you! Come back!"
