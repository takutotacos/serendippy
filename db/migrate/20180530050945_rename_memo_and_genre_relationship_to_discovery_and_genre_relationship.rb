class RenameMemoAndGenreRelationshipToDiscoveryAndGenreRelationship < ActiveRecord::Migration[5.1]
  def change
    rename_table :memo_and_genre_relationships, :discovery_and_genre_relationships
  end
end
