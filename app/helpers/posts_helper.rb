module PostsHelper
  def render_html(post)
    case post.format
    when 'image'
      if params[:action] == 'index'
        link_to image_tag(post.image.url(:thumbnail), class: 'img-responsive image-thumbnail'), post
      elsif params[:action] == 'show'
        link_to image_tag(post.image.url(:large), class: 'img-responsive image-thumbnail'), post.content, class: 'post-link'
      end
    when 'youtube'
      "<div class='youtube-thumbnail'><iframe src='http://www.youtube.com/embed/#{post.content}?showinfo=0&controls=0' width='330' frameborder='0'></iframe></div>".html_safe
    when 'vimeo'
      "<div class='vimeo-thumbnail'><iframe src='http://player.vimeo.com/video/#{post.content}?portrait=0&byline=0&title=0' width='330' frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>".html_safe
    when 'quote'
      #TODO
      "<div class='quote-thumbnail'>\"#{post.content}\"</div>".html_safe
    when 'spotify'
      "<div class='spotify-thumbnail'><iframe src='https://embed.spotify.com/?uri=spotify:track:#{post.content}&amp;view=coverart' width='330' height='80' frameborder='0' allowtransparency='true'></iframe></div>".html_safe
    when 'soundcloud'
      #TODO
      "<div class='soundcloud-thumbnail'>#{post.content}</div>".html_safe
    when 'definition'
      #TODO
      "<div class='definition-thumbnail'>#{post.content}</div>".html_safe
    end
  end
end
