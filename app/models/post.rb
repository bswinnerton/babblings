class Post < ActiveRecord::Base
  # attr_accessible :id, :post_type, :title, :content, :width, :height, :width_thumbnail, :height_thumbnail
  validates :content, :presence => true
end
