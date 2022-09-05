require 'test_helper'

class FashionPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fashion_posts_index_url
    assert_response :success
  end

end
