require 'spec_helper'

describe Post do
  let(:post) { create :quote }

  describe '#as_json' do
    it 'does not include BLACKLISTED_ATTRIBUTES when converted to json' do
      parsed_json = JSON.parse(post.to_json)
      expect(parsed_json.keys).to_not include %w(image_file_name image_content_type image_file_size backup_content)
    end
  end
end
