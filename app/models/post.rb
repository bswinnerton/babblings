class Post < ActiveRecord::Base
  attr_accessible :author, :content, :post_type, :is_deleted, :is_hidden
  validates :content, :post_type, :presence => true
  before_create :set_type

  def set_type
    if self.content =~ /(\.jpg|\.png|\.bmp|\.gif)$/
      self.post_type = 'image'
    elsif self.content =~ /youtube.com/
      self.post_type = 'youtube'
    elsif self.content =~ /vimeo.com/
      self.post_type = 'vimeo'
    elsif self.content =~ /spotify:track/
      self.post_type = 'spotify'
    else
      self.post_type = 'text'
    end
  end

end
