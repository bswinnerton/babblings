module PostsHelper
  def render_html(post)
    case post.format
    when 'image'
      if params[:action] == 'index' or params[:action] == 'page'
        rendered_html = "<div>#{link_to image_tag(post.image.url(:thumbnail), class: 'img-responsive image-thumbnail'), post}</div>"
      elsif params[:action] == 'show'
        rendered_html = "<div>#{link_to image_tag(post.image.url(:large), class: 'img-responsive image-thumbnail'), post.content, class: 'post-link'}"
      end
    when 'youtube'
      rendered_html = "<div class='youtube-thumbnail'><iframe src='http://www.youtube.com/embed/#{post.content}?showinfo=0&controls=0' width='330' frameborder='0'></iframe></div>"
    when 'vimeo'
      rendered_html = "<div class='vimeo-thumbnail'><iframe src='http://player.vimeo.com/video/#{post.content}?portrait=0&byline=0&title=0' width='330' frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>"
    when 'quote'
      rendered_html = "<div class='quote-thumbnail'><div class='notepad'>\"#{post.content}\"</div></div>"
    when 'spotify'
      rendered_html = "<div class='spotify-thumbnail'><iframe src='https://embed.spotify.com/?uri=spotify:track:#{post.content}&amp;view=coverart' width='330' height='80' frameborder='0' allowtransparency='true'></iframe></div>"
    when 'soundcloud'
      #TODO
      rendered_html = "<div class='soundcloud-thumbnail'>#{post.content}</div>"
    when 'definition'
      #TODO
      rendered_html = "<div class='definition-thumbnail'>#{post.content}</div>"
    end
    "<div class='post-box col-lg-4 col-md-4 col-sm-4'>#{rendered_html}</div>".html_safe
  end
end
