class AddInfoToBands < ActiveRecord::Migration
  def change
    add_column :bands, :soundcloud_id, :string
    add_column :bands, :hottest_track_permalink, :string
  end
end
