require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  # ToDo
  # Page can be viewed if user is logged in
  # List of all services provided by website are available whether user is logged in or not
end
