class Admin::GenresController < ApplicationController
  
  def index
    @genres = Genre.all
    @genre = Genre.
  end
  
  def edit
  end
  
end
