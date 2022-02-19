class CreateTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :texts do |t|
      t.string :author
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
