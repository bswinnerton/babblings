class Picture < Post
  class FetchImageError < StandardError; end

  has_attached_file :image,
    styles: { full: "#{FULL_WIDTH}", thumbnail: "#{THUMBNAIL_WIDTH}" },
    default_url: 'missing_:style.png',
    convert_options: { full: '-quality 100' },
    preserve_files: 'true'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  process_in_background :image

  before_save :save_image
  before_save :set_dimensions

  scope :active, -> { where(image_processing: false) }

  def self.geometry(image)
    g = Paperclip::Geometry.from_file(image)
    [g.width.to_i, g.height.to_i, (g.height.to_f / g.width.to_f)]
  end

  def width_for(size)
    size == :thumbnail ? THUMBNAIL_WIDTH : maximum_width
  end

  def height_for(size)
    size == :thumbnail ? (THUMBNAIL_WIDTH * ratio).round : (maximum_width * ratio).round
  end

private

  def save_image
    self.image = fetch_image
  rescue FetchImageError
    self.errors.add(:base, 'I had trouble grabbing that image.')
    false
  end

  def fetch_image
    Timeout::timeout(29) { URI.parse(content) }
  rescue OpenURI::HTTPError, Timeout::Error
    raise FetchImageError
  end

  def set_dimensions
    return unless self.image
    geometry = Picture.geometry(image.queued_for_write[:original])
    self.width, self.height, self.ratio = geometry
  end

  def maximum_width
    width < FULL_WIDTH ? width : FULL_WIDTH
  end
end
