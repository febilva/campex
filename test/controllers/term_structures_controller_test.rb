require 'test_helper'

class TermStructuresControllerTest < ActionController::TestCase
  setup do
    @term_structure = term_structures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:term_structures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create term_structure" do
    assert_difference('TermStructure.count') do
      post :create, term_structure: { name: @term_structure.name }
    end

    assert_redirected_to term_structure_path(assigns(:term_structure))
  end

  test "should show term_structure" do
    get :show, id: @term_structure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @term_structure
    assert_response :success
  end

  test "should update term_structure" do
    patch :update, id: @term_structure, term_structure: { name: @term_structure.name }
    assert_redirected_to term_structure_path(assigns(:term_structure))
  end

  test "should destroy term_structure" do
    assert_difference('TermStructure.count', -1) do
      delete :destroy, id: @term_structure
    end

    assert_redirected_to term_structures_path
  end
end
