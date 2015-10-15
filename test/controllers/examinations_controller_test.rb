require 'test_helper'

class ExaminationsControllerTest < ActionController::TestCase
  setup do
    @examination = examinations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:examinations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create examination" do
    assert_difference('Examination.count') do
      post :create, examination: { code: @examination.code, course_id: @examination.course_id, end_date: @examination.end_date, name: @examination.name, registration_close_date: @examination.registration_close_date, registration_open_date: @examination.registration_open_date, start_date: @examination.start_date, syllabus_id: @examination.syllabus_id, term_structure_entry_id: @examination.term_structure_entry_id }
    end

    assert_redirected_to examination_path(assigns(:examination))
  end

  test "should show examination" do
    get :show, id: @examination
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @examination
    assert_response :success
  end

  test "should update examination" do
    patch :update, id: @examination, examination: { code: @examination.code, course_id: @examination.course_id, end_date: @examination.end_date, name: @examination.name, registration_close_date: @examination.registration_close_date, registration_open_date: @examination.registration_open_date, start_date: @examination.start_date, syllabus_id: @examination.syllabus_id, term_structure_entry_id: @examination.term_structure_entry_id }
    assert_redirected_to examination_path(assigns(:examination))
  end

  test "should destroy examination" do
    assert_difference('Examination.count', -1) do
      delete :destroy, id: @examination
    end

    assert_redirected_to examinations_path
  end
end
