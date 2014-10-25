class Picture < Post
  has_attached_file :image,
    styles: { full: "#{FULL_WIDTH}", thumbnail: "#{THUMBNAIL_WIDTH}" },
    default_url: '/images/:style/missing.png',
    convert_options: { full: '-quality 100' },
    preserve_files: 'true'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  before_create :fetch_image
  before_create :persist_dimensions

  def width_for(size)
    size == :thumbnail ? THUMBNAIL_WIDTH : maximum_width
  end

  def height_for(size)
    size == :thumbnail ? (THUMBNAIL_WIDTH * ratio).round : (maximum_width * ratio).round
  end

private

  def fetch_image
    Timeout::timeout(20) { self.image = URI.parse(content) }
  rescue
    self.image = fetch_backup_image
  #rescue OpenURI::HTTPError
  #  self.errors.add(:base, 'I had trouble grabbing that image.')
  #  false
  end

  def fetch_backup_image
    URI.parse(backup_content)
  end

  def persist_dimensions
    geometry = Paperclip::Geometry.from_file(image.queued_for_write[:original])
    self.width = geometry.width.to_i
    self.height = geometry.height.to_i
    self.ratio = height.to_f / width.to_f
  end

  def maximum_width
    width < FULL_WIDTH ? width : FULL_WIDTH
  end

  def maximum_height
    height < FULL_HEIGHT ? height : FULL_HEIGHT
  end
end
