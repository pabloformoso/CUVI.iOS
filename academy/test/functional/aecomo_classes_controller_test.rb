require 'test_helper'

class AecomoClassesControllerTest < ActionController::TestCase
  setup do
    @aecomo_class = aecomo_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aecomo_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aecomo_class" do
    assert_difference('AecomoClass.count') do
      post :create, aecomo_class: { description: @aecomo_class.description, ends_at: @aecomo_class.ends_at, name: @aecomo_class.name, starts_at: @aecomo_class.starts_at }
    end

    assert_redirected_to aecomo_class_path(assigns(:aecomo_class))
  end

  test "should show aecomo_class" do
    get :show, id: @aecomo_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aecomo_class
    assert_response :success
  end

  test "should update aecomo_class" do
    put :update, id: @aecomo_class, aecomo_class: { description: @aecomo_class.description, ends_at: @aecomo_class.ends_at, name: @aecomo_class.name, starts_at: @aecomo_class.starts_at }
    assert_redirected_to aecomo_class_path(assigns(:aecomo_class))
  end

  test "should destroy aecomo_class" do
    assert_difference('AecomoClass.count', -1) do
      delete :destroy, id: @aecomo_class
    end

    assert_redirected_to aecomo_classes_path
  end
end
