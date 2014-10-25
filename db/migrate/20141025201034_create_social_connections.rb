class CreateSocialConnections < ActiveRecord::Migration
  def change
    create_table :social_connections do |t|
      t.string :display_name
      t.string :uri
      t.string :service
      t.integer :band_id

      t.timestamps
    end
  end
end
