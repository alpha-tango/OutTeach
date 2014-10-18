class AddTimestampsToElements < ActiveRecord::Migration
  def change
    add_column :elements, :created_at, :datetime
    add_column :elements, :updated_at, :datetime
  end
end
