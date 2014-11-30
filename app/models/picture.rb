class Picture < Post
  include Fetchable

  has_attached_file :image,
    styles: { full: "#{FULL_WIDTH}", thumbnail: "#{THUMBNAIL_WIDTH}" },
    default_url: 'missing_:style.png',
    convert_options: { full: '-quality 100' },
    preserve_files: 'true'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  process_in_background :image

  fetches :image, from: :content
  before_save :set_dimensions

  scope :active, -> { where(image_processing: false) }

  def self.geometry(image)
    g = Paperclip::Geometry.from_file(image)
    [g.width.to_i, g.height.to_i, (g.height.to_f / g.width.to_f)]
  end

  def for_dimensions(size)
    width = size == :thumbnail ? THUMBNAIL_WIDTH : maximum_width
    height = size == :thumbnail ? thumbnail_height : maximum_height
    [width, height]
  end

  private

  def set_dimensions
    return unless self.image
    geometry = Picture.geometry(image.queued_for_write[:original])
    self.width, self.height, self.ratio = geometry
  end

  def thumbnail_height
    (THUMBNAIL_WIDTH * ratio).round
  end

  def maximum_height
    (maximum_width * ratio).round
  end

  def maximum_width
    width < FULL_WIDTH ? width : FULL_WIDTH
  end
end
