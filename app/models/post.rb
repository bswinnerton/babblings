class Post < ActiveRecord::Base
  attr_accessible :author, :content, :post_type, :is_deleted, :is_hidden
  validates :content, :post_type, :presence => true
  before_create :set_type

  def set_type
		# Image
    if self.content =~ /(\.jpg|\.png|\.bmp|\.gif)$/
      self.post_type = 'image'
			self.original_path = self.content
		# YouTube
    elsif self.content =~ /(#(?<=v=)[a-zA-Z0-9-]+(?=&)|(?<=v\/)[^&\n]+(?=\?)|(?<=v=)[^&\n]+|(?<=youtu.be\/)[^&\n]+#)/
      self.post_type = 'youtube'
			self.original_path = self.content
			self.content = $1
			self.width = 280
			self.height = 158
		# Vimeo
    elsif self.content =~ /^.*(vimeo\.com\/)((channels\/[A-z]+\/)|(groups\/[A-z]+\/videos\/))?([0-9]+)/
      self.post_type = 'vimeo'
			self.original_path = self.content
			self.content = $5
			self.width = 280
			self.height = 158
		# Spotify
    elsif self.content =~ /spotify:track:([a-zA-Z0-9]{22})/
      self.post_type = 'spotify'
			self.original_path = self.content
			self.content = $1
		# Text
    else
      self.post_type = 'text'
    end
  end

end
