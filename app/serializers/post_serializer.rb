class PostSerializer < ActiveModel::Serializer
  attributes :id, :type, :content, :width, :height, :ratio, :created_at, :updated_at, :image_updated_at, :deleted_at, :image_processing, :thumbnail_image, :full_image

  def thumbnail_image
    return unless object.type == 'Picture'
    object.image(:thumbnail)
  end

  def full_image
    return unless object.type == 'Picture'
    object.image(:full)
  end
end
