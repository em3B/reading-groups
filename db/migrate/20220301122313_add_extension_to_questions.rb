class AddExtensionToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :extension, :boolean
  end
end
