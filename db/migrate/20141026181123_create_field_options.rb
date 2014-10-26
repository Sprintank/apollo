class CreateFieldOptions < ActiveRecord::Migration
  def change
    create_table :field_options do |t|
      t.string :name
      t.string :kind
      t.string :default
      t.integer :order

      t.timestamps
    end
  end
end
