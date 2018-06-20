class AddDiscoveryRefToGenres < ActiveRecord::Migration[5.1]
  def change

    add_reference :discoveries, :genres, index: true
  end
end
