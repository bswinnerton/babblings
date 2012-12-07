require 'test_helper'

class PostsControllerTest < ActionController::TestCase

	test "should get index" do
		#puts Post.all
		get :index
		#puts @response.body
		assert_response :success
		assert_select '.contentBox', minimum: 5
	end

	test "should get at least first page"	do
		get(:page, {'page' => 0})
		assert_response :success
		assert_select '.contentBox', minimum: 5
	end

	# TODO: fix so that 15 is dynamic in sitewide variable
	test "should get second page if greater than 15 posts" do
		if Post.all.count > 15
			get(:page, {'page' => 0})
    	assert_response :success
    	assert_select '.contentBox', minimum: 15
		end
	end

end
