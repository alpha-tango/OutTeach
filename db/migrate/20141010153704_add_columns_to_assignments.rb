class AddColumnsToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :importance, :text, null: false
    add_column :assignments, :goals, :text, null: false
  end
end
