class AddAttachmentPhotoToWeights < ActiveRecord::Migration
  def self.up
    change_table :weights do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :weights, :photo
  end
end
