class SearchController < ApplicationController
  def new
    @discoveries = Discovery.where(user_id: current_user.id).order(created_at: :desc)
    @genres = Genre.all
  end

  def show
    binding.pry
    of_genres = params[:search][:genre][:id]
    content = params[:search][:content]
    @genres = Genre.all
    @discoveries = Discovery.where(user_id: current_user.id, genres_id: of_genres).to_a
    render :new
  end
private

  def search_params
    params.require("search").permit(:content, :genre_ids)
  end
end
