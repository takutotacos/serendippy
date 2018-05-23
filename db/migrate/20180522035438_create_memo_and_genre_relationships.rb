class CreateMemoAndGenreRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :memo_and_genre_relationships do |t|
      t.belongs_to :genre, index: true
      t.belongs_to :memo, index: true

      t.timestamps
    end
  end
end
