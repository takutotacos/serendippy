class TimelineController < ApplicationController

  def index
    @genre = Genre.new
    @discovery = Discovery.new

    @genres = Genre.order(:created_at).all
    @discoveries = Discovery.where(user_id: current_user.id).order(created_at: :desc)
  end
end