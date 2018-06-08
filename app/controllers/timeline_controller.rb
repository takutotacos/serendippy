class TimelineController < ApplicationController

  def index
    @discoveries = current_user.discoveries
  end
end