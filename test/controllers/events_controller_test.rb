require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @event1 = events(:one)
  end

  test "should get index" do
    sign_out users(:one)
    get events_url
    assert_response :success
  end

  test "should not get new when logged out" do
    sign_out users(:one)
    get new_event_url
    assert_response :redirect
  end
end
