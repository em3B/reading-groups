class AddReadingGroupToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reading_group_id, :integer
  end
end
