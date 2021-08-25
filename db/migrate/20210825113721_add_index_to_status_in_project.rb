class AddIndexToStatusInProject < ActiveRecord::Migration[6.1]
  def change
    add_index :projects, :status
  end
end
