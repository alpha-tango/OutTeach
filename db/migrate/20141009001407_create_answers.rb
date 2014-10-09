class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.string :text, null: false
      t.boolean :correct?, null: false, default: false
    end
  end
end
