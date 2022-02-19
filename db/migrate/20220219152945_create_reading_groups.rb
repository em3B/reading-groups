class CreateReadingGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :reading_groups do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
