require 'test_helper'

class StundentsControllerTest < ActionController::TestCase
  setup do
    @stundent = stundents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stundents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stundent" do
    assert_difference('Stundent.count') do
      post :create, stundent: { city: @stundent.city, email: @stundent.email, lastname: @stundent.lastname, name: @stundent.name }
    end

    assert_redirected_to stundent_path(assigns(:stundent))
  end

  test "should show stundent" do
    get :show, id: @stundent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stundent
    assert_response :success
  end

  test "should update stundent" do
    put :update, id: @stundent, stundent: { city: @stundent.city, email: @stundent.email, lastname: @stundent.lastname, name: @stundent.name }
    assert_redirected_to stundent_path(assigns(:stundent))
  end

  test "should destroy stundent" do
    assert_difference('Stundent.count', -1) do
      delete :destroy, id: @stundent
    end

    assert_redirected_to stundents_path
  end
end
