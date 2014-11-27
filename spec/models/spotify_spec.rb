require 'spec_helper'

describe Spotify do
  describe 'embed_url' do
    let(:post) { create :spotify }

    it 'returns the embedable URL for the post' do
      expect(post.embed_url).to eq "https://embed.spotify.com/?uri=spotify:track:#{post.content}&amp;view=coverart"
    end
  end
end
