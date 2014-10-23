class VimeoDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def render(options = {})
    "<iframe src='http://player.vimeo.com/video/#{content}?portrait=0&byline=0&title=0' width='#{width}' height='#{height}' frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>".html_safe
  end
end
