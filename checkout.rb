class Checkout
    attr_accessor :list
    def initialize()
        @list = {}
    end

    def add_item(item)
        list[item.name] = item.price
        puts "You have added #{item.name}, for £#{'%.2f' % item.price}, to your basket"
    end

    def total
        total = list.values.sum
        puts "Your total so far is £#{'%.2f' % total}."
    end
end

class Item
    attr_accessor :name, :price
    def initialize(name, price)
        @name = name
        @price = price
    end
end

sausages = Item.new("sausages", 5.00)
milk = Item.new("milk", 3.00)

checkout = Checkout.new()

checkout.add_item(milk)
checkout.add_item(sausages)
checkout.total

=begin
class Payment
    attr_accessor :card, :payment_due
    def initialize(card, payment_due)
        @card = card
        @payment_due = payment_due
    end

    def balance()
        new_balance = card.credit - payment_due
        puts "Your remaining credit is £#{'%.2f' % new_balance}." 
    end
end


class Card
    attr_accessor :credit
    def initialize(credit)
        @credit = credit
    end
end

card = Card.new(100.00)
payment = Payment.new(card, 8.00)

payment.balance()
=end