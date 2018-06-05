class RenameMemoToDiscovery < ActiveRecord::Migration[5.1]
  def change
    rename_table :memos, :discoveries
  end
end
