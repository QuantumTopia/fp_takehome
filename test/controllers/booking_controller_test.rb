require "test_helper"

class BookingControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @event1 = events(:one)
  end

  test "should get index when logged in" do
    get bookings_url
    assert_response :success
  end

  test "should get new when logged in" do
    get new_booking_url @event1.id
    assert_response :success
  end

  test "should not get index when logged out" do
    sign_out users(:one)
    get bookings_url
    assert_response :redirect
  end

  test "should not get new when logged out" do
    sign_out users(:one)
    get new_booking_url @event1.id
    assert_response :redirect
  end

  # ToDo
  # User can view bookings they have made when logged in
  # Bookings cannot be viewed if not logged in
  # User cannot view bookings for other users
  # Not allowed to make a booking for an event that does not exist
  # Not allowed to book more than the remaining number of tickets +edge cases (+-1 ticket)
  # Allowed to book less than or equal to the remaining number of tickets +edge cases (+-1 ticket)
  # Allowed to book tickets concurrently (current rudimentary locking will not allow)
  # Not allowed to book tickets concurrently if total exceeds total remaining tickets
end
