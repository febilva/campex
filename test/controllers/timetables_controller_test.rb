require 'test_helper'

class TimetablesControllerTest < ActionController::TestCase
  setup do
    @timetable = timetables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timetables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timetable" do
    assert_difference('Timetable.count') do
      post :create, timetable: { batch_id: @timetable.batch_id, class_timing_id: @timetable.class_timing_id, end_date: @timetable.end_date, start_date: @timetable.start_date, term_structure_entry_id: @timetable.term_structure_entry_id }
    end

    assert_redirected_to timetable_path(assigns(:timetable))
  end

  test "should show timetable" do
    get :show, id: @timetable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timetable
    assert_response :success
  end

  test "should update timetable" do
    patch :update, id: @timetable, timetable: { batch_id: @timetable.batch_id, class_timing_id: @timetable.class_timing_id, end_date: @timetable.end_date, start_date: @timetable.start_date, term_structure_entry_id: @timetable.term_structure_entry_id }
    assert_redirected_to timetable_path(assigns(:timetable))
  end

  test "should destroy timetable" do
    assert_difference('Timetable.count', -1) do
      delete :destroy, id: @timetable
    end

    assert_redirected_to timetables_path
  end
end
