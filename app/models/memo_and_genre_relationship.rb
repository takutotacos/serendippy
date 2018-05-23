class MemoAndGenreRelationship < ApplicationRecord
  belongs_to :memo
  belongs_to :genre
end