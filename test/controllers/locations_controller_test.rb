require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @location = locations(:location_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should show location" do
    get :show, id: @location
    assert_response :success
  end

  test "should update location" do
    patch :update, id: @location, location: { lat: @location.lat, locationable_id: @location.locationable_id, locationable_type: @location.locationable_type, long: @location.long }
    assert_redirected_to location_path(assigns(:location))
  end
end
