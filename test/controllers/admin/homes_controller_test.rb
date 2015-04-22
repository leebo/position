require 'test_helper'

class Admin::HomesControllerTest < ActionController::TestCase
  setup do
    @admin_home = admin_homes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_homes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_home" do
    assert_difference('Admin::Home.count') do
      post :create, admin_home: {  }
    end

    assert_redirected_to admin_home_path(assigns(:admin_home))
  end

  test "should show admin_home" do
    get :show, id: @admin_home
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_home
    assert_response :success
  end

  test "should update admin_home" do
    patch :update, id: @admin_home, admin_home: {  }
    assert_redirected_to admin_home_path(assigns(:admin_home))
  end

  test "should destroy admin_home" do
    assert_difference('Admin::Home.count', -1) do
      delete :destroy, id: @admin_home
    end

    assert_redirected_to admin_homes_path
  end
end
