class ChangeDataTypeForDescription < ActiveRecord::Migration[6.1]
  def self.up
    change_table :projects do |t|
      t.change :description, :text
    end
  end
  def self.down
    change_table :projects do |t|
      t.change :description, :string
    end
  end
end
