class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.all
  end

  def confirm
    @order = Order.new(order_params)
    @order.postage = 800
    @order.customer = current_customer
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order.total = (@order.postage) + (@total)
    @order.pay_method = params[:order][:pay_method]
    if params[:order][:selected_address] == "0"
      @order.postcode_mail = current_customer.postal_code
      @order.address_mail = current_customer.address
      @order.name_mail = current_customer.full_name
      
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
   
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_details = OrderDetail.new
        @order_details.item_id = cart_item.item.id
        @order_details.order_id = @order.id
        @order_details.price = cart_item.item.price
        @order_details.amount = cart_item.amount
        @order_details.save
      current_customer.cart_items.destroy_all
      end
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end
  
  def update
  end
  
  private
  def order_params
    params.require(:order).permit(:postcode_mail, :address_mail, :name_mail, :pay_method, :is_active, :postage, :total)
  end
end
