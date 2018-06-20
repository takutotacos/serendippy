class RemoveGenresIdFromDiscoveries < ActiveRecord::Migration[5.1]
  def change
    remove_reference :discoveries, :genres, index: true
  end
end
