class AddFieldsToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :reporter_id, :integer
    add_index :tasks, :reporter_id
    add_column :tasks, :assignee_id, :integer
    add_index :tasks, :assignee_id
    remove_foreign_key :tasks, :users
    remove_reference :tasks, :user
  end
end
