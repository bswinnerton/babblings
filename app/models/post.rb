class Post < ActiveRecord::Base
  SUPPORTED_FORMATS = %w(image youtube vimeo quote spotify soundcloud definition)
  MAX_PER_PAGE = 15
  WIDTHS = { small: 180, medium: 264, large: 350, full: 1000 }

  before_save :pull_image, :save_dimensions
  scope :recent, -> { order(created_at: :desc) }
  scope :limited, -> { limit(Post::MAX_PER_PAGE) }
  validates_presence_of :format, :content

  has_attached_file :image, styles: { thumbnail: "#{Post::WIDTHS[:large]}x", large: "#{Post::WIDTHS[:full]}x" }

#  def determine_format
#    supported_formats_in_regex = SUPPORTED_FORMATS.join("|")
#    self.format = self.content.match(/(#{supported_formats_in_regex}):(.*)$/).captures.first
#    self.content = self.content.match(/(#{supported_formats_in_regex}):(.*)$/).captures.second
#  end

  def pull_image
    if self.format == 'image'
      if self.created_at.present? && self.created_at < Time.new('2013-10-18 00:00:00 -0400')
        self.image = URI.parse(self.original_path)
      else
        self.image = URI.parse(self.content)
      end
    end
  end

  def save_dimensions
    if self.format == 'image'
      dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
      self.width = dimensions.width
      self.height = dimensions.height
      self.ratio = dimensions.height / dimensions.width
    end
  end
end
