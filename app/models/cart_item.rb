class CartItem < ApplicationRecord
    
    belongs_to :user
    belongs_to :item
    
    def subtotal
      item.price * amount
    end
  
end
