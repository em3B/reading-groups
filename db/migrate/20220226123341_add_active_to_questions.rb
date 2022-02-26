class AddActiveToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :active, :boolean
  end
end
