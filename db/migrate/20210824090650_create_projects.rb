class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
