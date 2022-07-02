class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.all
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order] [:selected_address] == "0"
      @order.address = current_customer.address
      
    elsif params[:order][:selected_address] == "1"
      @order.address = params[:address][:full_address].to_i
      
    elsif params[:order][:selected_address] == "2"
      @order.address = current_customer.address
    end
  end

  def complete
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
    params.require(:cart_item).permit(:postcode_mail, :address_mail, :name_mail, :pay_method, :is_active, :postage, :total, :selected_address)
  end
end
