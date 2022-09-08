class OrdersController < ApplicationController
  
  def new
    @user = current_user
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    cart_item = current_user.cart_items.all
    @order.save
    @order.user_id = current_user.id
      current_user.cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.item_id
        @order_item.price = cart_item.item_id
        @order_item.amount = cart_item.amount
        @order_item.save
      end
      cart_item.destroy_all
      redirect_to complete_orders_path
  end
  
  def confirm
    @user = current_user
    @cart_items = CartItem.all
    @order = current_user.orders.new
    @order = Order.new(order_params)
    
    @total = 0
    @order.user_id = current_user.id
    if params[:order] == "0"
      @order.name = current_user.name
    end
  end
  
  def complete
  end
  
  def index
    @orders = Order.all
    @order = current_user.orders
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.orderitems
    @user = current_user
  end
  
private
  def order_params
    params.require(:order).permit(:user_id, :name, :address, :pay_method)
  end
  
end
