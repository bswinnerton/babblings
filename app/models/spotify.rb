class Spotify < Post
  def embed_url
    "https://embed.spotify.com/?uri=spotify:track:#{content}&amp;view=coverart"
  end
end
