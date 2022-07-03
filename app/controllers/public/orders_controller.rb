class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.all
  end

  def confirm
    @order = Order.new(order_params)
    @order.postage = 800
    @customer = current_customer
    @cart_items = @customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.pay_method = params[:order][:pay_method]
    if params[:order][:selected_address] == "0"
      @order.postcode_mail = @customer.postal_code
      @order.address_mail = @customer.address
      @order.name_mail = @customer.full_name
      
    elsif params[:order][:selected_address] == "1"
      @address = Address.find(params[:order][:address])
      @order.postcode_mail = @address.postal_code
      @order.address_mail = @address.address
      @order.name_mail = @address.name
      
    elsif params[:order][:selected_address] == "2"
      @order.postcode_mail 
      @order.address_mail 
      @order.name_mail 
    end
  end

  def complete
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_items = @order.order_detail.new
        @order_items.item_id = order_detail.item.id
        @order_items.price = order_detail.item.price
        @order_items.quantity = order_detail.amount
        @order_items.save
      current_customer.cart_items.destroy_all
      end
    redirect_to orders_complete_path
  end
  
  def create
  end

  def index
  end

  def show
  end
  
  def update
  end
  
  private
  def order_params
    params.require(:order).permit(:postcode_mail, :address_mail, :name_mail, :pay_method, :is_active, :postage, :total, :selected_address, :address)
  end
end
