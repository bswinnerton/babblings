require 'spec_helper'

describe Vimeo do
  describe 'embed_url' do
    let(:post) { create :vimeo }

    it 'returns the embedable URL for the post' do
      expect(post.embed_url).to eq "http://player.vimeo.com/video/#{post.content}?portrait=0&byline=0&title=0"
    end
  end
end
