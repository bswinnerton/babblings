module PostsHelper
  def calculate_post_width
    if session[:browser_width].to_i < 768
      Post::WIDTHS[:large]
    elsif session[:browser_width].to_i >= 768 && session[:browser_width].to_i < 992
      Post::WIDTHS[:small]
    elsif session[:browser_width].to_i >= 992 && session[:browser_width].to_i < 1200
      Post::WIDTHS[:medium]
    elsif session[:browser_width].to_i > 1200
      Post::WIDTHS[:large]
    end
  end

  def calculate_post_height(post)
    width = calculate_post_width
    if post.format == 'image'
      (width * post.ratio).round
    elsif post.format == 'youtube' or post.format == 'vimeo'
      (width * 0.5).round
    end
  end

  def show_html(post)
    if params[:action] == 'index' or params[:action] == 'page'
      "<div class='post-box col-lg-4 col-md-4 col-sm-4'>#{render_html(post)}</div>".html_safe
    else
      "<div class='col-lg-8 col-lg-offset-2 col-md-8 col-lg-offset-2 col-sm-8 col-sm-offset-2'>#{render_html(post)}</div>".html_safe
    end
  end

  def render_html(post)
    width = calculate_post_width
    height = calculate_post_height(post)
    case post.format
    when 'image'
      if params[:action] == 'index' or params[:action] == 'page'
        "<div>#{link_to image_tag(post.image.url(:thumbnail), class: 'img-responsive image-thumbnail', width: width, height: height), post }</div>"
      elsif params[:action] == 'show'
        "<div>#{link_to image_tag(post.image.url(:large), class: 'img-responsive image-thumbnail'), post.content, class: 'post-link'}"
      end
    when 'youtube'
      "<div class='youtube-thumbnail'><iframe src='http://www.youtube.com/embed/#{post.content}?showinfo=0&controls=0' width='#{width - 24}' height='#{height}' frameborder='0'></iframe></div>"
    when 'vimeo'
      "<div class='vimeo-thumbnail'><iframe src='http://player.vimeo.com/video/#{post.content}?portrait=0&byline=0&title=0' width='#{width - 24}' height='#{height}' frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>"
    when 'quote'
      "<div class='quote-thumbnail'><div class='notepad'>\"#{post.content}\"</div></div>"
    when 'spotify'
      "<div class='spotify-thumbnail'><iframe src='https://embed.spotify.com/?uri=spotify:track:#{post.content}&amp;view=coverart' width='#{width - 24}' height='80' frameborder='0' allowtransparency='true'></iframe></div>"
    when 'soundcloud'
      #TODO
      "<div class='soundcloud-thumbnail'>#{post.content}</div>"
    when 'definition'
      #TODO
      "<div class='definition-thumbnail'>#{post.content}</div>"
    end
  end
end
