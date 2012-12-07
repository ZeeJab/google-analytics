require 'test_helper'

class NinjasControllerTest < ActionController::TestCase
  setup do
    @ninja = ninjas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ninjas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ninja" do
    assert_difference('Ninja.count') do
      post :create, ninja: { name: @ninja.name }
    end

    assert_redirected_to ninja_path(assigns(:ninja))
  end

  test "should show ninja" do
    get :show, id: @ninja
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ninja
    assert_response :success
  end

  test "should update ninja" do
    put :update, id: @ninja, ninja: { name: @ninja.name }
    assert_redirected_to ninja_path(assigns(:ninja))
  end

  test "should destroy ninja" do
    assert_difference('Ninja.count', -1) do
      delete :destroy, id: @ninja
    end

    assert_redirected_to ninjas_path
  end
end
