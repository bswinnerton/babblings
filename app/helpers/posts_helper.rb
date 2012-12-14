module PostsHelper

  def format_type(post)
    if post.post_type == "image" && controller.action_name == "show"
      if post.width > 960 
        ratio = post.height.to_f / post.width.to_f
        post.width = 960 
        post.height = ratio * 960 
      end 
    end 

    case post.post_type
    when "image"
      if controller.action_name == "index"
        post.content = link_to image_tag(post.image.url(:thumbnail), :width => post.width_thumbnail, :height => post.height_thumbnail), post_path(post)
      else
        post.content = image_tag post.image.url(:large)
      end 
    when "youtube"
      post.content = "<iframe width=\"280\" height=\"158\" src=\"http://www.youtube.com/embed/" + post.content + "?showinfo=0\" frameborder=\"0\"></iframe>"
    when "vimeo"
      post.content = "<iframe width=\"280\" height=\"158\" src=\"http://player.vimeo.com/video/" + post.content + "?portrait=0&byline=0&title=0\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>"
    when "spotify"
      post.content = "<iframe src=\"https://embed.spotify.com/?uri=spotify:track:" + post.content + "&amp;view=coverart\" width=\"280\" height=\"360\" frameborder=\"0\" allowtransparency=\"true\"></iframe>"
    when "text"
      post.content = "<div id=\"text\">" + post.content + "</div>"
    end 

    return post.content
  end

end
