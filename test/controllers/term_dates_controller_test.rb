require 'test_helper'

class TermDatesControllerTest < ActionController::TestCase
  setup do
    @term_date = term_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:term_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create term_date" do
    assert_difference('TermDate.count') do
      post :create, term_date: { batch_id: @term_date.batch_id, end_date: @term_date.end_date, start_date: @term_date.start_date, term_structure_entry_id: @term_date.term_structure_entry_id }
    end

    assert_redirected_to term_date_path(assigns(:term_date))
  end

  test "should show term_date" do
    get :show, id: @term_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @term_date
    assert_response :success
  end

  test "should update term_date" do
    patch :update, id: @term_date, term_date: { batch_id: @term_date.batch_id, end_date: @term_date.end_date, start_date: @term_date.start_date, term_structure_entry_id: @term_date.term_structure_entry_id }
    assert_redirected_to term_date_path(assigns(:term_date))
  end

  test "should destroy term_date" do
    assert_difference('TermDate.count', -1) do
      delete :destroy, id: @term_date
    end

    assert_redirected_to term_dates_path
  end
end
