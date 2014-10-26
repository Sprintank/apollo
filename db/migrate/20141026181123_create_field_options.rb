class CreateFieldOptions < ActiveRecord::Migration
  def change
    create_table :field_options do |t|
      t.string :name
      t.string :type
      t.string :default

      t.timestamps
    end
  end
end
