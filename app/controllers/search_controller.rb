class SearchController < ApplicationController
  def new
    @discoveries = Discovery.where(user_id: current_user.id).order(created_at: :desc)
    @genres = Genre.all
  end

  def show
    of_genres = params[:search][:genre].present? ? params[:search][:genre][:id] : []
    content = params[:search][:content]
    before_time = params[:search][:time_span].present? ? params[:search][:time_span][:id] : []
    before_time = if before_time.blank?
                    ""
                  elsif before_time == 0
                    1.day.ago
                  elsif before_time == 1
                    7.day.ago
                  elsif before_time == 2
                    1.month.ago
                  elsif before_time == 3
                    3.month.ago
                  end
    @genres = Genre.all
    @discoveries = Discovery.where(user_id: current_user.id)

    # todo 検索が複数回走っちゃうので、一回で終わらせられるように処理を書き換える。
    @discoveries = @discoveries.where("content like '%#{content}%'") if content.present?
    @discoveries = @discoveries.joins(:discovery_and_genre_relationships).where(discovery_and_genre_relationships: { genre_id: of_genres }) if of_genres.present?
    @discoveries = @discoveries.where(:created_at => before_time) if before_time.present?
    render :new
  end

private

  def search_params
    params.require("search").permit(:content, :genre_ids)
  end
end
