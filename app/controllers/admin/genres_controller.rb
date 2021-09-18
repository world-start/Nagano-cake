class Admin::GenresController < ApplicationController
  
  
  def create
     @genre = Genre.new(genre_params)
     @genre.save
  if @item.save
    redirect_to admin_genres_path 
  else
    render admin_genres_path
  end
  end
  
  def index
    @genres = Genre.all
  #   genre = Genre.new(genre_params)
  #   genre.save
  #   redirect_to admin_genres_path 
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
  if @genre.save
    redirect_to admin_genres_path
  else
    render edit_admin_genre_path(@genre)
  end
  end
  
  # .require(:genre)を消す
  private
  def genre_params
    params.permit(:name)
  end
  
end
