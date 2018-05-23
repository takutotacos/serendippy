class Genre < ApplicationRecord
  has_many :memo, through: :memo_and_genre_relationship

  validates :name, presence: true
  validates :name, uniqueness: true
end
