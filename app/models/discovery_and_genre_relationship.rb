class DiscoveryAndGenreRelationship < ApplicationRecord
  belongs_to :discovery
  belongs_to :genre
end