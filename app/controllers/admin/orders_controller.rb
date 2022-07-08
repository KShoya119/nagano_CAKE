class Admin::OrdersController < ApplicationController
  before_action :move_to_signed_in
  def show
    @order = Order.find(params[:id])
  end
  
  private
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admins/sign_in'
    end
  end
end
