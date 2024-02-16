require "test_helper"

class ChatPageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get chat_page_home_url
    assert_response :success
  end
end
