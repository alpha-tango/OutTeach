class AddTypeToElements < ActiveRecord::Migration
  def change
    add_column :elements, :type_id, :integer, null: false
  end
end
