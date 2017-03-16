class AddQuestionIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :question_id, :integer, default: 1
  end
end
