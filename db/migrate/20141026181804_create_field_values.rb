class CreateFieldValues < ActiveRecord::Migration
  def change
    create_table :field_values do |t|
      t.references :band, index: true
      t.references :field_option, index: true
      t.string :value

      t.timestamps
    end
  end
end
