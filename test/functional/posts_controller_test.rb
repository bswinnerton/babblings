require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  test "should get index" do
    #puts Post.all
    get :index
    #puts @response.body
    assert_response :success
    assert_select '.contentBox', minimum: 5
  end

  test "should get at least first page" do
    get(:page, {'page' => 0})
    assert_response :success
    assert_select '.contentBox', minimum: 5
  end

  test "should get second page if greater than items_per_page" do
    if Post.all.count > Rails.configuration.items_per_page
      get(:page, {'page' => 1})
      assert_response :success
      assert_select '.contentBox', minimum: Rails.configuration.items_per_page
    end
  end

end
