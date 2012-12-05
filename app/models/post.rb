class Post < ActiveRecord::Base
  attr_accessible :author, :content, :post_type
  validates :content, :presence => true
  before_create :set_type

  def set_type
    if self.content =~ /(\.jpg|\.png|\.bmp|\.gif)$/
      self.post_type = 'image'
    end
  end
end
