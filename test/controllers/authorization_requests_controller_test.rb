require 'test_helper'

class AuthorizationRequestsControllerTest < ActionController::TestCase
  setup do
    @authorization_request = authorization_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authorization_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create authorization_request" do
    assert_difference('AuthorizationRequest.count') do
      post :create, authorization_request: { approval_date: @authorization_request.approval_date, approval_remarks: @authorization_request.approval_remarks, approval_user: @authorization_request.approval_user, request_params: @authorization_request.request_params, request_remarks: @authorization_request.request_remarks, request_type: @authorization_request.request_type, request_user: @authorization_request.request_user, status: @authorization_request.status }
    end

    assert_redirected_to authorization_request_path(assigns(:authorization_request))
  end

  test "should show authorization_request" do
    get :show, id: @authorization_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @authorization_request
    assert_response :success
  end

  test "should update authorization_request" do
    patch :update, id: @authorization_request, authorization_request: { approval_date: @authorization_request.approval_date, approval_remarks: @authorization_request.approval_remarks, approval_user: @authorization_request.approval_user, request_params: @authorization_request.request_params, request_remarks: @authorization_request.request_remarks, request_type: @authorization_request.request_type, request_user: @authorization_request.request_user, status: @authorization_request.status }
    assert_redirected_to authorization_request_path(assigns(:authorization_request))
  end

  test "should destroy authorization_request" do
    assert_difference('AuthorizationRequest.count', -1) do
      delete :destroy, id: @authorization_request
    end

    assert_redirected_to authorization_requests_path
  end
end
