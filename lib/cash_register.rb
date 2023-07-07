class CashRegister
    attr_accessor :discount, :total, :items, :prices
    def initialize(discount=20,total=0)
        @discount=discount
        @total = 0
        @items =[]
        @prices = []
    end
    def add_item(title,price,quantity=1)
        @quantity = quantity
        @title = title
        @total+=price*@quantity   
        @items.concat([@title]*quantity)
        @prices.concat([price])
    end
    def apply_discount
        employee_discount = @total *(@discount/100.0)
        if employee_discount > 0
            @total -= employee_discount
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        @total -= @prices[-1]
        @items.pop
        @total = 0.0 if @items.empty?
    end
end
