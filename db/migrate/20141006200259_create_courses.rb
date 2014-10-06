class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.string :subject, null: false
      t.text :description, null: false
    end
  end
end
