class AddAttachmentImageToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :posts, :image
  end
end
