class AddDescriptionToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :description, :text, null: false
  end
end
