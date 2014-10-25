class AddImageProcessingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_processing, :boolean, default: false
  end
end
