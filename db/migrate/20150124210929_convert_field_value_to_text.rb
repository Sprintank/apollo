class ConvertFieldValueToText < ActiveRecord::Migration
  def up
    change_column :field_values, :value, :text
  end
  def down
    change_column :field_values, :value, :string
  end
end
