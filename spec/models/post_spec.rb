require 'spec_helper'

describe Post do
  let(:post) { create :quote }

  it 'does not include BLACKLISTED_ATTRIBUTES when converted to json' do
    parsed_json = JSON.parse(post.to_json)
    expect(parsed_json.keys).to_not include Post::BLACKLISTED_ATTRIBUTES
  end
end
