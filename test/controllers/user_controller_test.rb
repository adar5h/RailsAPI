require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get v1/article" do
    get user_v1/article_url
    assert_response :success
  end
end
