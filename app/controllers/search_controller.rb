class SearchController < ApplicationController
  def new
    @discoveries = Discovery.where(user_id: current_user.id).order(created_at: :desc)
  end

  def search
  end

  private
end
