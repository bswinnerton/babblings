require 'test_helper'

class PostTest < ActiveSupport::TestCase
  fixtures :posts
	test "post attributes must not be empty" do
		post = Post.new
		assert post.invalid?
		assert post.errors[:content].any?
	end
end
