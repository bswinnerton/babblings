class Post < ActiveRecord::Base
  before_save :determine_format, :pull_image
  scope :recent, -> { order(created_at: :desc) }
  validates_presence_of :content
  has_attached_file :image, styles: { thumbnail: '350x', large: '1000x' }

  SUPPORTED_FORMATS = %w(image youtube vimeo quote spotify soundcloud definition)

  def determine_format
    supported_formats_in_regex = SUPPORTED_FORMATS.join("|")
    self.format = self.content.match(/(#{supported_formats_in_regex}):(.*)$/).captures.first
    self.content = self.content.match(/(#{supported_formats_in_regex}):(.*)$/).captures.second
  end

  def pull_image
    self.image = URI.parse(self.content) if self.format == 'image'
  end
end
