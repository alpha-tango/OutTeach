class AddIndexToQuestions < ActiveRecord::Migration
  def change
    add_index :questions, :quiz_id
  end
end
