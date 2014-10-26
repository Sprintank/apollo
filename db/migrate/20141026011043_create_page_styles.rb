class CreatePageStyles < ActiveRecord::Migration
  def change
    create_table :page_styles do |t|
      t.references :band
      t.string :field_name
      t.string :field_value

      t.timestamps
    end
  end
end
