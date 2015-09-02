require 'test_helper'

class LawyerCitiesControllerTest < ActionController::TestCase
  setup do
    @lawyer_city = lawyer_cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lawyer_cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lawyer_city" do
    assert_difference('LawyerCity.count') do
      post :create, lawyer_city: { average_rating: @lawyer_city.average_rating, exp: @lawyer_city.exp, lawyer_code: @lawyer_city.lawyer_code, lawyer_namestring: @lawyer_city.lawyer_namestring, location: @lawyer_city.location }
    end

    assert_redirected_to lawyer_city_path(assigns(:lawyer_city))
  end

  test "should show lawyer_city" do
    get :show, id: @lawyer_city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lawyer_city
    assert_response :success
  end

  test "should update lawyer_city" do
    patch :update, id: @lawyer_city, lawyer_city: { average_rating: @lawyer_city.average_rating, exp: @lawyer_city.exp, lawyer_code: @lawyer_city.lawyer_code, lawyer_namestring: @lawyer_city.lawyer_namestring, location: @lawyer_city.location }
    assert_redirected_to lawyer_city_path(assigns(:lawyer_city))
  end

  test "should destroy lawyer_city" do
    assert_difference('LawyerCity.count', -1) do
      delete :destroy, id: @lawyer_city
    end

    assert_redirected_to lawyer_cities_path
  end
end
