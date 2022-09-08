class GenresController < ApplicationController
  
  def show
    @genre = Genre.find(params[:id])
    @items = @genre.item.where(is_active: true)
    @genre = Genre.all
  end
  
end
