class PictureDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def render(options = {})
    options[:size] == :thumbnail ? linked_image_tag(options[:size]) : image_tag_with_dimensions(options[:size])
  end

  private

  def image_tag_with_dimensions(size)
    width, height = for_dimensions(size)
    image_tag image.url(size), width: width, height: height
  end

  def linked_image_tag(size)
    link_to image_tag_with_dimensions(size), post_path(self.object)
  end
end
