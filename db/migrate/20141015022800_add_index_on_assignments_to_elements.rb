class AddIndexOnAssignmentsToElements < ActiveRecord::Migration
  def change
    add_index :elements, :assignment_id
  end
end
