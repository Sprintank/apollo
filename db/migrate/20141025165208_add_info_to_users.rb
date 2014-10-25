class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :soundcloud_id, :string
    add_column :users, :username, :string
    add_column :users, :name, :string
  end
end
