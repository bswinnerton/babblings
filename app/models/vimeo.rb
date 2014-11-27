class Vimeo < Post
  def embed_url
    "http://player.vimeo.com/video/#{content}?portrait=0&byline=0&title=0"
  end
end
