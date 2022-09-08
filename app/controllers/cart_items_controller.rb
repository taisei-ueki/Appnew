class CartItemsController < ApplicationController
  
  def index
    @cart_item = current_user.cart_items
    @total = 0
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_item_path
  end
  
  def destroy_all
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy_all
    redirect_to cart_item_path
  end
  
  def create
    @new_cart_item = current_user.cart_items.new(cart_item_params)
    if current_user.cart_items.find_by(item_id: @new_cart_item.item.id)
      @cart_item = current_user.cart_items.find_by(item_id: @new_cart_item.item.id)
      @cart_item.amount += @new_cart_item.amount
      @cart_item.save
    else
      @new_cart_item.save
    end
    redirect_to public_cart_items_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
