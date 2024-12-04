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

  # ToDo
  # User gets list of all available events, even if not logged in
  # User cannot view list of events created by user when not logged in
  # User gets list of events they have created when logged in
  # User does not get events they have not created
  # User cannot create event without supplying necessary information
  # User cannot create event if not logged in
end
