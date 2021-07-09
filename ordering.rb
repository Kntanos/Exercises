class Shop
    attr_accessor :basket, :stock
    def initialize()
        #@basket = Basket.new()
        @stock = [
            {name: "Water Bottle", price: 8.00, stock_count: 5},
            {name: "Cheese Grater", price: 15.00, stock_count: 1},
          ]
    end
end

class Basket
    attr_accessor :basket, :shop_stock, :shop
    def initialize()
        @shop = Shop.new()
        @shop_stock = shop.stock
        @basket = []
    end
    
    def add_to_basket(product)
        check_in_stock(product)
    end
    
    def item_exist?(product)
        shop_stock.any?{ |item| item[:name] == product}
    end
    
    def check_in_stock(product)
        return false unless item_exist?(product) # this will return prematurely if the item doesnt exist
        if shop_stock.any?{ |item| item[:name] == product && item[:stock_count] >=1}
            add_item(product)
        end
    end  

    def add_item(product)
        @basket << shop_stock.select{ |item| item[:name] == product && item[:stock_count] >=1}
        puts "You have added #{product} to your basket."
    end

    def basket_total
        total = basket.flatten.map{|item| item[:price]}.sum
    end
end

class Checkout
    attr_accessor :total, :card
    def initialize(total)
        @total = total
        @card = card
    end

    def pay(card)
        puts "Your total is £#{'%.2f' % total}."
        if card.credit < total
            puts "You don't have sufficient funds!"
        else puts "Your new balance is £#{'%.2f' % (card.credit - total)}."
        end
    end
end

class CreditCard 
    attr_accessor :credit
    def initialize(credit)
        @credit = credit
    end
end

class User
    attr_accessor :name, :email, :address, :credit_card
    def initialize(name, email, address, credit_card)
        @name = name
        @email = email
        @address = address
        @credit_card = credit_card
    end
end

shop = Shop.new()
user = User.new("Kostas", "kostasntanos@hotmail.com", "2 Road Street", 25.00)
basket = Basket.new()
basket.add_to_basket("Water Bottle")
basket.add_to_basket("Cheese Grater")
checkout = Checkout.new(basket.basket_total) # It is better to give specific variables than whole objects, so that information that is not needed, does nto become accessible.
card = CreditCard.new(user.credit_card)
checkout.pay(card)