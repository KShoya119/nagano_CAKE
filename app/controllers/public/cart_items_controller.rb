class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_quantity = cart_item.quantity + @cart_item.quantity
        cart_item.update_attribute(:quantity, new_quantity)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to cart_items_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
