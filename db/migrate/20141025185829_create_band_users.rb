class CreateBandUsers < ActiveRecord::Migration
  def change
    create_table :band_users do |t|

      t.references :user, index: true
      t.references :band, index: true

      t.timestamps
    end
  end
end
