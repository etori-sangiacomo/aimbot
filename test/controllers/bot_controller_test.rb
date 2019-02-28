require 'test_helper'

class BotControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bot_create_url
    assert_response :success
  end

end
