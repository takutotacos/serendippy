class Genre < ApplicationRecord
  has_many :discovery_and_genre_relationships
  has_many :discoveries, through: :discovery_and_genre_relationships

  validates :name, presence: true
  validates :name, uniqueness: true
end
