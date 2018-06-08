class GenresController < ApplicationController

  def index
    @genres = Genre.all.to_a
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(_genre_params)
    if @genre.save
      index
      render :index
    else
      render :new
    end
  end

  def destroy
  end

private
  def _genre_params
    params.require(:genre).permit(:name)
  end
end