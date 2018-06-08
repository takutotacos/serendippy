class TimelineController < ApplicationController

  def index
    @genre = Genre.new
    @discovery = Discovery.new

    @genres = Genre.all.to_a
    @discoveries = current_user.discoveries
  end
end