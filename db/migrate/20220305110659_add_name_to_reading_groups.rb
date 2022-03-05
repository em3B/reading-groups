class AddNameToReadingGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :reading_groups, :name, :string
  end
end
