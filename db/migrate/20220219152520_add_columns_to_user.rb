class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string
    add_column :users, :teacher_id, :integer
  end
end
