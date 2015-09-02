require 'test_helper'

class SearchVakilControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get vakil_list" do
    get :vakil_list
    assert_response :success
  end

  test "should get search_by_city" do
    get :search_by_city
    assert_response :success
  end

  test "should get search_by_service" do
    get :search_by_service
    assert_response :success
  end

  test "should get search_by_city_and_service" do
    get :search_by_city_and_service
    assert_response :success
  end

end
