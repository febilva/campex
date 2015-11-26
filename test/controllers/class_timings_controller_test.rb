require 'test_helper'

class ClassTimingsControllerTest < ActionController::TestCase
  setup do
    @class_timing = class_timings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_timings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create class_timing" do
    assert_difference('ClassTiming.count') do
      post :create, class_timing: { name: @class_timing.name }
    end

    assert_redirected_to class_timing_path(assigns(:class_timing))
  end

  test "should show class_timing" do
    get :show, id: @class_timing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @class_timing
    assert_response :success
  end

  test "should update class_timing" do
    patch :update, id: @class_timing, class_timing: { name: @class_timing.name }
    assert_redirected_to class_timing_path(assigns(:class_timing))
  end

  test "should destroy class_timing" do
    assert_difference('ClassTiming.count', -1) do
      delete :destroy, id: @class_timing
    end

    assert_redirected_to class_timings_path
  end
end
