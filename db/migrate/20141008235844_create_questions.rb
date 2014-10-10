class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :quiz_id, null: false
      t.string :text, null: false
    end
  end
end
