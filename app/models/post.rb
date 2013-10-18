class Post < ActiveRecord::Base
  before_save :pull_image
  scope :recent, -> { order(created_at: :desc) }
  validates_presence_of :format, :content
  has_attached_file :image, styles: { thumbnail: '350x', large: '1000x' }

  SUPPORTED_FORMATS = %w(image youtube vimeo quote spotify soundcloud definition)

#  def determine_format
#    supported_formats_in_regex = SUPPORTED_FORMATS.join("|")
#    self.format = self.content.match(/(#{supported_formats_in_regex}):(.*)$/).captures.first
#    self.content = self.content.match(/(#{supported_formats_in_regex}):(.*)$/).captures.second
#  end

  def pull_image
    if self.created_at < Time.new('2013-10-18 00:00:00 -0400')
      self.image = URI.parse(self.original_path) if self.format == 'image'
    else
      self.image = URI.parse(self.content) if self.format == 'image'
    end
  end
end
