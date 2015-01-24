class AddDefaultThemeIdToBand < ActiveRecord::Migration
  def change
    add_column :bands, :theme_id, :integer, index: true, :null => false
  end
end
