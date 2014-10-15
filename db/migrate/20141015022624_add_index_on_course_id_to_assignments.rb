class AddIndexOnCourseIdToAssignments < ActiveRecord::Migration
  def change
    add_index :assignments, :course_id
  end
end
