class RemovePasswordFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :user, :password
  end
end