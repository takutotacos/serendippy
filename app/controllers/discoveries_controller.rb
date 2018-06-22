class DiscoveriesController < ApplicationController
  def index
  end

  def new
    @discovery = Discovery.new
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @discovery = Discovery.new(_discovery_params)
    @discovery.user = current_user
    if @discovery.save
      redirect_to timeline_path
    else
      render :new
    end
  end

  def update
    @discovery = Discovery.find(params[:id])
    if @discovery.update(_discovery_params)
      render json: {discovery: {
        content: @discovery.content,
        genre_ids: @discovery.genres.pluck(:id),
        genre_names: @discovery.genres.pluck(:name)
      }}
    else
      
    end
  end

private
  def _discovery_params
    params.require(:discovery).permit(:content, genre_ids: [])
  end
end
