require 'test_helper'

class ExamRegistrationsControllerTest < ActionController::TestCase
  setup do
    @exam_registration = exam_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exam_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam_registration" do
    assert_difference('ExamRegistration.count') do
      post :create, exam_registration: { examination_id: @exam_registration.examination_id, fees_paid: @exam_registration.fees_paid, paper_count: @exam_registration.paper_count, student_id: @exam_registration.student_id }
    end

    assert_redirected_to exam_registration_path(assigns(:exam_registration))
  end

  test "should show exam_registration" do
    get :show, id: @exam_registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exam_registration
    assert_response :success
  end

  test "should update exam_registration" do
    patch :update, id: @exam_registration, exam_registration: { examination_id: @exam_registration.examination_id, fees_paid: @exam_registration.fees_paid, paper_count: @exam_registration.paper_count, student_id: @exam_registration.student_id }
    assert_redirected_to exam_registration_path(assigns(:exam_registration))
  end

  test "should destroy exam_registration" do
    assert_difference('ExamRegistration.count', -1) do
      delete :destroy, id: @exam_registration
    end

    assert_redirected_to exam_registrations_path
  end
end
