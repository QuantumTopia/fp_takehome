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
end
