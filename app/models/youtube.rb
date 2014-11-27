class Youtube < Post
  def embed_url
    "http://www.youtube.com/embed/#{content}?showinfo=0&controls=0"
  end
end
