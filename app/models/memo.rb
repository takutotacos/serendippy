class Memo < ApplicationRecord
  belongs_to :user
  has_many :genres, through: :memo_and_genre_relationship

  validates :content, presence: true
end
