class VimeoDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def render(options = {})
    content_tag :iframe, nil, src: embed_url, width: width, height: height
  end
end
