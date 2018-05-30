class Discovery < ApplicationRecord
  belongs_to :user
  has_many :genres, through: :discovery_and_genre_relationship

  validates :content, presence: true
end
