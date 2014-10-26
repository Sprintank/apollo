class CreatePageStyles < ActiveRecord::Migration
  def change
    create_table :page_styles do |t|
      t.references :band, null: false
      t.string :field_name, null: false
      t.string :field_value, null: false

      t.timestamps
    end
  end
end
