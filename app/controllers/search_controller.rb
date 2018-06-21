class SearchController < ApplicationController
  def new
    @genres = Genre.all
    @search = Search.new
    @search.genres = @genres
    @discoveries = Discovery.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @search = Search.new(_search_params)
    @search.genres = @genres || Genre.all
    @discoveries = @search.search(current_user)

    render :new
  end

private

  def _search_params
    params.require("search").permit(:content, :created_at, :genres => [])
  end
end
