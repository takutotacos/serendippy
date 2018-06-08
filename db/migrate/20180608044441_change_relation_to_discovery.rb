class ChangeRelationToDiscovery < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:discovery_and_genre_relationships, :memo, index: true, foreign_key: true)
    add_reference(:discovery_and_genre_relationships, :discovery, index: true, foreign_key: true)
  end
end
