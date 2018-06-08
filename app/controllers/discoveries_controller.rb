class DiscoveriesController < ApplicationController
  def index
  end

  def new
    @discovery = Discovery.new
    @genres = Genre.all
  end

  def create
    @discovery = Discovery.new(_discovery_params)
    @discovery.user = current_user
    if @discovery.save
      # todo 登録後の画面を作成する。
    else
      render :new
    end
  end

  def update
  end

private
  def _discovery_params
    params.require(:discovery).permit(:content, genre_ids: [])
  end
end
