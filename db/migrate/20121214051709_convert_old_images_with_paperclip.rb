class ConvertOldImagesWithPaperclip < ActiveRecord::Migration
  def up
    Post.all.each do |post| 
      if post.post_type == "image" && post.image_file_name == nil
        post.get_image_from_url(post.original_path) if post.post_type == "image" 
        Post.has_attached_file :image, :styles => { :thumbnail => "280x", :large => "960x" }
        post.save
      end
    end
  end

  def down
    Post.all.each do |post|
      if post.post_type == "image"
        post.image_file_name = nil
        post.image_content_type = nil
        post.image_file_size = nil
        post.image_updated_at = nil
        post.save
      end
    end
  end
end
