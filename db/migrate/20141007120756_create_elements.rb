class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :title, null: false
      t.text :content
      t.string :url
      t.string :citation, null: false
      t.integer :assignment_id, null: false
    end
  end
end
