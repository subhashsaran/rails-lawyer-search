require 'test_helper'

class LawyerServicesControllerTest < ActionController::TestCase
  setup do
    @lawyer_service = lawyer_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lawyer_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lawyer_service" do
    assert_difference('LawyerService.count') do
      post :create, lawyer_service: { lawyer_code: @lawyer_service.lawyer_code, service_charge: @lawyer_service.service_charge, service_code: @lawyer_service.service_code, service_name: @lawyer_service.service_name }
    end

    assert_redirected_to lawyer_service_path(assigns(:lawyer_service))
  end

  test "should show lawyer_service" do
    get :show, id: @lawyer_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lawyer_service
    assert_response :success
  end

  test "should update lawyer_service" do
    patch :update, id: @lawyer_service, lawyer_service: { lawyer_code: @lawyer_service.lawyer_code, service_charge: @lawyer_service.service_charge, service_code: @lawyer_service.service_code, service_name: @lawyer_service.service_name }
    assert_redirected_to lawyer_service_path(assigns(:lawyer_service))
  end

  test "should destroy lawyer_service" do
    assert_difference('LawyerService.count', -1) do
      delete :destroy, id: @lawyer_service
    end

    assert_redirected_to lawyer_services_path
  end
end
