require 'test_helper'

class InternalMarksControllerTest < ActionController::TestCase
  setup do
    @internal_mark = internal_marks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internal_marks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internal_mark" do
    assert_difference('InternalMark.count') do
      post :create, internal_mark: { created_by: @internal_mark.created_by, mark: @internal_mark.mark, paper_id: @internal_mark.paper_id, student_id: @internal_mark.student_id, term_structure_entry_id: @internal_mark.term_structure_entry_id }
    end

    assert_redirected_to internal_mark_path(assigns(:internal_mark))
  end

  test "should show internal_mark" do
    get :show, id: @internal_mark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @internal_mark
    assert_response :success
  end

  test "should update internal_mark" do
    patch :update, id: @internal_mark, internal_mark: { created_by: @internal_mark.created_by, mark: @internal_mark.mark, paper_id: @internal_mark.paper_id, student_id: @internal_mark.student_id, term_structure_entry_id: @internal_mark.term_structure_entry_id }
    assert_redirected_to internal_mark_path(assigns(:internal_mark))
  end

  test "should destroy internal_mark" do
    assert_difference('InternalMark.count', -1) do
      delete :destroy, id: @internal_mark
    end

    assert_redirected_to internal_marks_path
  end
end
