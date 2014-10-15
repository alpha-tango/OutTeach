class AddIndexOnCoursesToQuizzes < ActiveRecord::Migration
  def change
    add_index :quizzes, :course_id
  end
end
