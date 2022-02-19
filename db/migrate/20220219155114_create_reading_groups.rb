class CreateReadingGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :reading_groups do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
