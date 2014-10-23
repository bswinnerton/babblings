class YoutubeDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def render(options = {})
    "<iframe src='http://www.youtube.com/embed/#{content}?showinfo=0&controls=0' width='#{width}' height='#{height}' frameborder='0'></iframe>".html_safe
  end
end
