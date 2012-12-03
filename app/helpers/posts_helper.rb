module PostsHelper

  def format_type(postid, type, content, width, height, view, environment)
    if type == "image" && view == "single"
      if width > 960 
        ratio = height.to_f / width.to_f
        width = 960 
        height = ratio * 960 
      end 
    end 

    case type
    when "image"
      if view == "all"
        content = "<a href=\"posts/" + postid.to_s + "\"><img src=\"" + environment + "images/thumbnails/posts/" + content + "\" width=\"280\" height=\"" + height.to_s + "\" /></a>"
      else
        content = "<img src=\"" + environment + "images/posts/" + content + "\" width=\"" + width.to_s + "\" height=\"" + height.to_s + "\" />";
      end 
    when "youtube"
      content = "<iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/" + content + "?showinfo=0\" frameborder=\"0\"></iframe>"
    when "vimeo"
      content = "<iframe width=\"280\" height=\"158\" src=\"http://player.vimeo.com/video/" + content + "?portrait=0&byline=0&title=0\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>"
    when "spotify"
      content = "<iframe src=\"https://embed.spotify.com/?uri=spotify:track:" + content + "&amp;view=coverart\" width=\"280\" height=\"360\" frameborder=\"0\" allowtransparency=\"true\"></iframe>"
    when "text"
      content = "<div id=\"text\">" + content + "</div>"
    end 

    return content
  end

end
