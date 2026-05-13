require 'test_helper'

class FeedbackEntriesControllerTest < ActionController::TestCase
  setup do
    @feedback_entry = feedback_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedback_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback_entry" do
    assert_difference('FeedbackEntry.count') do
      post :create, feedback_entry: { feedback_field_id: @feedback_entry.feedback_field_id, post_id: @feedback_entry.post_id, status: @feedback_entry.status, user_id: @feedback_entry.user_id, value: @feedback_entry.value }
    end

    assert_redirected_to feedback_entry_path(assigns(:feedback_entry))
  end

  test "should show feedback_entry" do
    get :show, id: @feedback_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback_entry
    assert_response :success
  end

  test "should update feedback_entry" do
    patch :update, id: @feedback_entry, feedback_entry: { feedback_field_id: @feedback_entry.feedback_field_id, post_id: @feedback_entry.post_id, status: @feedback_entry.status, user_id: @feedback_entry.user_id, value: @feedback_entry.value }
    assert_redirected_to feedback_entry_path(assigns(:feedback_entry))
  end

  test "should destroy feedback_entry" do
    assert_difference('FeedbackEntry.count', -1) do
      delete :destroy, id: @feedback_entry
    end

    assert_redirected_to feedback_entries_path
  end
end
