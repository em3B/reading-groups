class AddCoverImageToTexts < ActiveRecord::Migration[6.1]
  def change
    add_column :texts, :cover_image, :string
  end
end
