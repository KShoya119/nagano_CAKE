class Admin::OrderDetailsController < ApplicationController
  before_action :move_to_signed_in
  def update
  end
  
  private
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admins/sign_in'
    end
  end
end
