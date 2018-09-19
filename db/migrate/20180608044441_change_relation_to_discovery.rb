class ChangeRelationToDiscovery < ActiveRecord::Migration[5.1]
  def change
    add_reference(:discovery_and_genre_relationships, :discovery, index: true, foreign_key: true)
  end
end
