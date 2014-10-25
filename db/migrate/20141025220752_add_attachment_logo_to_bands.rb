class AddAttachmentLogoToBands < ActiveRecord::Migration
  def self.up
    change_table :bands do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :bands, :logo
  end
end
