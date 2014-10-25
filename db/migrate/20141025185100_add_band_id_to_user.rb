class AddBandIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :band_id, :integer
    add_column :users, :access_token, :string
  end
end
