class RemoveBandIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :band_id
  end
end
