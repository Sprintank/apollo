class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :description
      t.string :identifier, :null => false

      t.timestamps
    end
    add_index :bands, :identifier, :unique => true
  end
end