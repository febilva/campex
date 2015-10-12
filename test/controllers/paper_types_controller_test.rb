require 'test_helper'

class PaperTypesControllerTest < ActionController::TestCase
  setup do
    @paper_type = paper_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paper_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paper_type" do
    assert_difference('PaperType.count') do
      post :create, paper_type: { code: @paper_type.code, name: @paper_type.name }
    end

    assert_redirected_to paper_type_path(assigns(:paper_type))
  end

  test "should show paper_type" do
    get :show, id: @paper_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paper_type
    assert_response :success
  end

  test "should update paper_type" do
    patch :update, id: @paper_type, paper_type: { code: @paper_type.code, name: @paper_type.name }
    assert_redirected_to paper_type_path(assigns(:paper_type))
  end

  test "should destroy paper_type" do
    assert_difference('PaperType.count', -1) do
      delete :destroy, id: @paper_type
    end

    assert_redirected_to paper_types_path
  end
end
