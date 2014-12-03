require 'test_helper'

class VoiceTalentUsersControllerTest < ActionController::TestCase
  setup do
    @voice_talent_user = voice_talent_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voice_talent_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voice_talent_user" do
    assert_difference('VoiceTalentUser.count') do
      post :create, voice_talent_user: {  }
    end

    assert_redirected_to voice_talent_user_path(assigns(:voice_talent_user))
  end

  test "should show voice_talent_user" do
    get :show, id: @voice_talent_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voice_talent_user
    assert_response :success
  end

  test "should update voice_talent_user" do
    patch :update, id: @voice_talent_user, voice_talent_user: {  }
    assert_redirected_to voice_talent_user_path(assigns(:voice_talent_user))
  end

  test "should destroy voice_talent_user" do
    assert_difference('VoiceTalentUser.count', -1) do
      delete :destroy, id: @voice_talent_user
    end

    assert_redirected_to voice_talent_users_path
  end
end
