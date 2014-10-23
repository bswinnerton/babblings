class SpotifyDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def render(options = {})
    "<iframe src='https://embed.spotify.com/?uri=spotify:track:#{content}&amp;view=coverart' width='#{width}' height='80' frameborder='0' allowtransparency='true'></iframe>".html_safe
  end
end
