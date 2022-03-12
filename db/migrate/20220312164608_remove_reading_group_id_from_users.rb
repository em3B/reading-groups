class RemoveReadingGroupIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :reading_group_id, :integer
  end
end
