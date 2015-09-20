require 'test_helper'

class WebinarsControllerTest < ActionController::TestCase
  setup do
    @webinar = webinars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:webinars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create webinar" do
    assert_difference('Webinar.count') do
      post :create, webinar: { chat_id: @webinar.chat_id, user_id: @webinar.user_id }
    end

    assert_redirected_to webinar_path(assigns(:webinar))
  end

  test "should show webinar" do
    get :show, id: @webinar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @webinar
    assert_response :success
  end

  test "should update webinar" do
    patch :update, id: @webinar, webinar: { chat_id: @webinar.chat_id, user_id: @webinar.user_id }
    assert_redirected_to webinar_path(assigns(:webinar))
  end

  test "should destroy webinar" do
    assert_difference('Webinar.count', -1) do
      delete :destroy, id: @webinar
    end

    assert_redirected_to webinars_path
  end
end
