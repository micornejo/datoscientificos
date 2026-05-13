require 'test_helper'

class UserIdentitiesControllerTest < ActionController::TestCase
  setup do
    @user_identity = user_identities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_identities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_identity" do
    assert_difference('UserIdentity.count') do
      post :create, user_identity: { provider: @user_identity.provider, uid: @user_identity.uid, user_id: @user_identity.user_id }
    end

    assert_redirected_to user_identity_path(assigns(:user_identity))
  end

  test "should show user_identity" do
    get :show, id: @user_identity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_identity
    assert_response :success
  end

  test "should update user_identity" do
    patch :update, id: @user_identity, user_identity: { provider: @user_identity.provider, uid: @user_identity.uid, user_id: @user_identity.user_id }
    assert_redirected_to user_identity_path(assigns(:user_identity))
  end

  test "should destroy user_identity" do
    assert_difference('UserIdentity.count', -1) do
      delete :destroy, id: @user_identity
    end

    assert_redirected_to user_identities_path
  end
end
