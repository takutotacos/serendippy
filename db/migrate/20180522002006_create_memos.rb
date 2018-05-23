class CreateMemos < ActiveRecord::Migration[5.1]
  def change
    create_table :memos do |t|
      t.string :content
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
