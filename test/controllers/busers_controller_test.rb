require 'test_helper'

class BusersControllerTest < ActionController::TestCase
  setup do
    @buser = busers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:busers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buser" do
    assert_difference('Buser.count') do
      post :create, buser: { name: @buser.name }
    end

    assert_redirected_to buser_path(assigns(:buser))
  end

  test "should show buser" do
    get :show, id: @buser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buser
    assert_response :success
  end

  test "should update buser" do
    patch :update, id: @buser, buser: { name: @buser.name }
    assert_redirected_to buser_path(assigns(:buser))
  end

  test "should destroy buser" do
    assert_difference('Buser.count', -1) do
      delete :destroy, id: @buser
    end

    assert_redirected_to busers_path
  end
end
