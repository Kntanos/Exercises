require "mail"

class User
    attr_accessor :name, :email, :address, :credit_card
    def initialize(name, email, address, credit_card)
        @name = name
        @email = email
        @address = address
        @credit_card = credit_card
    end
end

class CreditCard
    attr_accessor :credit
    def initialize(user)
        @credit = user.credit_card
    end
end

class Shop
    attr_accessor :basket, :items, :name
    def initialize(name)
        @name = name
        @basket = []
        @items = [
        {name: "Water Bottle", price: 8.00, stock_count: 5},
        {name: "Cheese Grater", price: 15.00, stock_count: 1},
      ]
    end

    def add_item_to_basket(product)
        unless (items.map{ |item| item.value?(product)}).include?(true) 
            puts "Product not found!"
        end
        if items.map{ |item| item.value?(product) && item[:stock_count] >=1}.include?(true)
            basket << items.select{ |item| item.value?(product)}
            puts "You have added #{product} to your #{name} basket."
        else puts "The product is out of stock!"
        end
    end

    def checkout(card)
        #list = basket.flatten.map{ |item| item[:name]}
        puts "Your total is £#{'%.2f' % total}"
        puts "You have £#{'%.2f' % card.credit} in your card."
        puts "Your new balance is £#{'%.2f' % (card.credit - total)}."
    end

    def total
       total = basket.flatten.map{|item| item[:price]}.sum
    end
end

user_1 = User.new("Kostas", "kostasntanos@hotmail.com", "2 Road Street", 25.00)
card = CreditCard.new(user_1)
shop = Shop.new("Amazon")
shop.add_item_to_basket("Water Bottle")
shop.add_item_to_basket("Cheese Grater")
shop.checkout(card)

=begin
mail = Mail.new do
    from    "kostasntanos@hotmail.com"
    to      "kostasntanps@hotmail.com"
    subject "Your Amazon Order... not really"
    body    "body"
  end
  mail.deliver!
=end