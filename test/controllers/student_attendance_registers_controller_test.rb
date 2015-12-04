require 'test_helper'

class StudentAttendanceRegistersControllerTest < ActionController::TestCase
  setup do
    @student_attendance_register = student_attendance_registers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_attendance_registers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_attendance_register" do
    assert_difference('StudentAttendanceRegister.count') do
      post :create, student_attendance_register: { batch_id: @student_attendance_register.batch_id, marked_date: @student_attendance_register.marked_date, period_id: @student_attendance_register.period_id, teacher_id: @student_attendance_register.teacher_id }
    end

    assert_redirected_to student_attendance_register_path(assigns(:student_attendance_register))
  end

  test "should show student_attendance_register" do
    get :show, id: @student_attendance_register
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_attendance_register
    assert_response :success
  end

  test "should update student_attendance_register" do
    patch :update, id: @student_attendance_register, student_attendance_register: { batch_id: @student_attendance_register.batch_id, marked_date: @student_attendance_register.marked_date, period_id: @student_attendance_register.period_id, teacher_id: @student_attendance_register.teacher_id }
    assert_redirected_to student_attendance_register_path(assigns(:student_attendance_register))
  end

  test "should destroy student_attendance_register" do
    assert_difference('StudentAttendanceRegister.count', -1) do
      delete :destroy, id: @student_attendance_register
    end

    assert_redirected_to student_attendance_registers_path
  end
end
