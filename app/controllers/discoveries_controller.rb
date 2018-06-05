class DiscoveriesController < ApplicationController
  def index
  end

  def new
    @discovery = Discovery.new
    @genres = Genre.all
  end

  def create
  end

  def update
  end
end
