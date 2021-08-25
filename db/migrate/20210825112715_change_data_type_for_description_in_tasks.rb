class ChangeDataTypeForDescriptionInTasks < ActiveRecord::Migration[6.1]
  def self.up
    change_table :tasks do |t|
      t.change :description, :text
    end
  end
  def self.down
    change_table :tasks do |t|
      t.change :description, :string
    end
  end
end
