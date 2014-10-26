class CreateFieldOptions < ActiveRecord::Migration
  def change
    create_table :field_options do |t|
      t.string :name
      t.string :identifier, :null => false
      t.string :kind
      t.string :default
      t.integer :order

      t.timestamps
    end
    add_index :field_options, :identifier, :unique => true
  end
end