class Search
  include ActiveModel::Model
  TIME_SPAN = {
    day: 1,
    week: 7,
    month: 30,
    three_month: 90,
    none: ""
  }.freeze

  attr_accessor :created_at, :content, :genres, :genres_selected

  def initialize(params = {})
    self.genres_selected = params[:genres]&.map(&:to_i)
    self.created_at = params[:created_at]
    self.content = params[:content]
  end

  def created_ats
    TIME_SPAN
  end

  def genre_selected?(num)
    genres_selected&.include?(num)
  end

  def search(user)
    @discoveries = Discovery.where(user_id: user.id)

    @discoveries = @discoveries.where("content like '%#{content}%'") if content.present?
    @discoveries = @discoveries.where("discoveries.created_at > ?", _created_at) if _created_at.present?
    @discoveries = @discoveries.joins(:discovery_and_genre_relationships).where(discovery_and_genre_relationships: { genre_id: genres_selected }) if genres_selected.present?
    @discoveries.to_a
  end

private

  def _created_at
    return "" if created_at.blank?

    created_at.to_i.days.ago
  end
end