class Admin::ItemsController < ApplicationController
  before_action :move_to_signed_in
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.is_active = true
    @item.genre_id = 0
    @item.save!
    redirect_to admin_items_show_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_items_show_path
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id)
  end
  
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admins/sign_in'
    end
  end
end
