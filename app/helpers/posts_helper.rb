module PostsHelper
  def show_html(post)
    if params[:action] == 'index' or params[:action] == 'page'
      "<div class='post-box col-lg-4 col-md-4 col-sm-4'>#{render_html(post)}</div>".html_safe
    else
      "<div class='col-lg-8 col-lg-offset-2 col-md-8 col-lg-offset-2 col-sm-8 col-sm-offset-2'>#{render_html(post)}</div>".html_safe
    end
  end

  def render_html(post)
    case post.format
    when 'image'
      if params[:action] == 'index' or params[:action] == 'page'
        "<div>#{link_to image_tag(post.image.url(:thumbnail), class: 'img-responsive image-thumbnail'), post}</div>"
      elsif params[:action] == 'show'
        "<div>#{link_to image_tag(post.image.url(:large), class: 'img-responsive image-thumbnail'), post.content, class: 'post-link'}"
      end
    when 'youtube'
      "<div class='youtube-thumbnail'><iframe src='http://www.youtube.com/embed/#{post.content}?showinfo=0&controls=0' width='330' frameborder='0'></iframe></div>"
    when 'vimeo'
      "<div class='vimeo-thumbnail'><iframe src='http://player.vimeo.com/video/#{post.content}?portrait=0&byline=0&title=0' width='330' frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>"
    when 'quote'
      "<div class='quote-thumbnail'><div class='notepad'>\"#{post.content}\"</div></div>"
    when 'spotify'
      "<div class='spotify-thumbnail'><iframe src='https://embed.spotify.com/?uri=spotify:track:#{post.content}&amp;view=coverart' width='330' height='80' frameborder='0' allowtransparency='true'></iframe></div>"
    when 'soundcloud'
      #TODO
      "<div class='soundcloud-thumbnail'>#{post.content}</div>"
    when 'definition'
      #TODO
      "<div class='definition-thumbnail'>#{post.content}</div>"
    end
  end
end
