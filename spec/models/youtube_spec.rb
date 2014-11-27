require 'spec_helper'

describe Youtube do
  describe 'embed_url' do
    let(:post) { create :youtube }

    it 'returns the embedable URL for the post' do
      expect(post.embed_url).to eq "http://www.youtube.com/embed/#{post.content}?showinfo=0&controls=0"
    end
  end
end
