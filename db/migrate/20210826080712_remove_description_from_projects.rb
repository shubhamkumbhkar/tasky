class RemoveDescriptionFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :description, :text
  end
end
