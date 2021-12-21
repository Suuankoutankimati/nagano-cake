class Admin::GenresController < ApplicationController
  # before_action :if_not_admin
  def index
    @genres = Genre.page(params[:page]).reverse_order
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
  
  # def if_not_admin
  #   redirect_to new_admin_session_path unless admin_signed_in?
  # end
end
