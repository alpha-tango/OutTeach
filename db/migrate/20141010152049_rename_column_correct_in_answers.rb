class RenameColumnCorrectInAnswers < ActiveRecord::Migration
  def change
    rename_column :answers, :correct?, :correct
  end
end
