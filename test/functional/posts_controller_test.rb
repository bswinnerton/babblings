require 'test_helper'

class PostsControllerTest < ActionController::TestCase
	test "should get index" do
		#puts Post.all

		get :index
		#puts @response.body
		assert_response :success
		assert_select '.contentBox', minimum: 5
	end
end
