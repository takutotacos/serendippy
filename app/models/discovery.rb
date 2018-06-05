class Discovery < ApplicationRecord
  belongs_to :user
  has_many :discovery_and_genre_relationships
  has_many :genres, through: :discovery_and_genre_relationships

  validates :content, presence: true
end
