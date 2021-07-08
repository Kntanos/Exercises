class Basket
    attr_accessor :list
    def initialize()
        @list ={}
    end

    def add_item(item)
        list[item.name] = item.price
        puts "You have added #{item.name}, for £#{'%.2f' % item.price}, to your basket."
    end

    def total
        total = list.values.sum
    end 
end

class Product
    attr_accessor :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
end

class Checkout
    attr_accessor :basket_total, :card
    def initialize(basket_total)
        @basket_total = basket_total
        @card = card
    end

    def payment_due()
        puts "Your total to pay is £#{'%.2f' % basket_total.total}."
    end

    def pay(card)
        puts "You have £#{'%.2f' % card.credit} on your card."
        puts "Your new balance is £#{'%.2f' % (card.credit - basket_total.total)}."
    end
end

class Card
    attr_accessor :credit
    def initialize(credit)
        @credit = credit
    end
end

basket = Basket.new()
sausages = Product.new("sausages", 5.00)
milk = Product.new("milk", 3.00)

basket.add_item(milk)
basket.add_item(sausages)
basket.total
checkout = Checkout.new(basket)
checkout.payment_due()

card = Card.new(10.00)
checkout.pay(card)