class Admin::GenresController < ApplicationController
  before_action :move_to_signed_in
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to '/admin/genres'
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to '/admin/genres'
  end
  
  
  private
  
  def genre_params
    params.require(:genre).permit(:name, :id)
  end
  
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admins/sign_in'
    end
  end
end
