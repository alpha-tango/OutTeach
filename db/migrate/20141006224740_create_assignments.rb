class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title, null: false
      t.integer :course_id, null: false
    end
  end
end
