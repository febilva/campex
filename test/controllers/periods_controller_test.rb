require 'test_helper'

class PeriodsControllerTest < ActionController::TestCase
  setup do
    @period = periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create period" do
    assert_difference('Period.count') do
      post :create, period: { class_timing_id: @period.class_timing_id, end_time: @period.end_time, is_break: @period.is_break, name: @period.name, start_time: @period.start_time }
    end

    assert_redirected_to period_path(assigns(:period))
  end

  test "should show period" do
    get :show, id: @period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @period
    assert_response :success
  end

  test "should update period" do
    patch :update, id: @period, period: { class_timing_id: @period.class_timing_id, end_time: @period.end_time, is_break: @period.is_break, name: @period.name, start_time: @period.start_time }
    assert_redirected_to period_path(assigns(:period))
  end

  test "should destroy period" do
    assert_difference('Period.count', -1) do
      delete :destroy, id: @period
    end

    assert_redirected_to periods_path
  end
end
