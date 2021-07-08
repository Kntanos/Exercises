class Shop
    attr_accessor :name, :basket, :stock
    def initialize(name)
        @name = name
        @basket = Basket.new
        @stock = [
            {name: "Water Bottle", price: 8.00, stock_count: 5},
            {name: "Cheese Grater", price: 15.00, stock_count: 1},
          ]
    end
end

class Basket
    attr_accessor :basket, :shop_stock, :shop_name, :shop
    def initialize()
        @shop_stock = shop.stock
        @shop_name = shop.name
        @shop = shop
        @basket = []
    end

    def item_exist?(item)
        item.exist?(item) # totally pseudocode
    end
    
    def check_in_stock
        return false unless item_exist?(item) # this will return prematurely if the item doesnt exist
        # pseucode: check if the stock count of the item is more than or equal to 1
    end
    
    def add_to_basket(item)
        check_in_stock
    end
end
=begin
    def add_item_to_basket(product)
        if !shop_stock.any?{ |item| item[:name] == product}
            puts "Product not found!"
        elsif shop_stock.any?{ |item| item[:name] == product && item[:stock_count] >=1} == true
            basket << shop_stock.select{ |item| item[:name] == product && item[:stock_count] >=1}
            puts "You have added #{product} to your #{shop.name} basket."
        else puts "This product is out of stock!" 
        end
    end

    def basket_total
         basket.flatten.map{|item| item[:price]}.sum
    end
end
=end
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

shop = Shop.new("Amazon")
user = User.new("Kostas", "kostasntanos@hotmail.com", "2 Road Street", 25.00)
basket = Basket.new(shop.stock)
basket.add_item_to_basket("Water Bottle")
basket.add_item_to_basket("Cheese Grater")
basket.basket_total
checkout = Checkout.new(basket.basket_total) # It is better to give specific variables than whole objects, so that information that is not needed, does nto become accessible.
card = CreditCard.new(user.credit_card)
checkout.pay(card)