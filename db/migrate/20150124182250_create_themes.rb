class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :identifier, :null => false
      t.boolean :is_featured, :default => false

      t.timestamps
    end
    add_index :themes, :identifier, :unique => true
  end
end
