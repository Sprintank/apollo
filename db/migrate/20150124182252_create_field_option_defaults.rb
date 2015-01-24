class CreateFieldOptionDefaults < ActiveRecord::Migration
  def change
    remove_column :field_options, :default

    create_table :field_option_defaults do |t|
      t.references :theme, index: true
      t.references :field_option, index: true
      t.string :value

      t.timestamps
    end
  end
end
