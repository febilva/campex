require 'test_helper'

class TermStructureEntriesControllerTest < ActionController::TestCase
  setup do
    @term_structure_entry = term_structure_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:term_structure_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create term_structure_entry" do
    assert_difference('TermStructureEntry.count') do
      post :create, term_structure_entry: { code: @term_structure_entry.code, name: @term_structure_entry.name, term_structure_id: @term_structure_entry.term_structure_id }
    end

    assert_redirected_to term_structure_entry_path(assigns(:term_structure_entry))
  end

  test "should show term_structure_entry" do
    get :show, id: @term_structure_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @term_structure_entry
    assert_response :success
  end

  test "should update term_structure_entry" do
    patch :update, id: @term_structure_entry, term_structure_entry: { code: @term_structure_entry.code, name: @term_structure_entry.name, term_structure_id: @term_structure_entry.term_structure_id }
    assert_redirected_to term_structure_entry_path(assigns(:term_structure_entry))
  end

  test "should destroy term_structure_entry" do
    assert_difference('TermStructureEntry.count', -1) do
      delete :destroy, id: @term_structure_entry
    end

    assert_redirected_to term_structure_entries_path
  end
end
