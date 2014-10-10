require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @request.env['HTTP_REFERER'] =  'http://test.host/technicians/1/ratings'
    @technician = technicians(:technician_one)
    @rating = ratings(:rating_one)
  end

  test "should get index" do
    get :index, technician_id: @technician.id
    assert_response :success
    assert_not_nil assigns(:ratings)
  end

  test "should create rating" do
    assert_difference('Rating.count') do
      post :create, rating: @rating.attributes, technician_id: @technician.id
    end
    assert_redirected_to rating_path(assigns(:rating))
  end

  test "should update rating" do
    patch :update, id: @rating, rating: { stars: @rating.stars, technician_id: @rating.technician_id, comment: @rating.comment }
    assert_redirected_to rating_path(assigns(:rating))
  end

  test "should destroy rating" do
    assert_difference('Rating.count', -1) do
      delete :destroy, id: @rating
    end

    assert_redirected_to technician_ratings_path(:technician_id => 1)
  end
end
