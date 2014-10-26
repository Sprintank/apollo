class RemovingSocialConnectionsAndPageStyles < ActiveRecord::Migration
  def change
    drop_table :social_connections
    drop_table :page_styles
  end
end
