class Order < ApplicationRecord
    has_many   :order_items
    has_many   :items, throuth: :order_item
    belongs_to :user
end
