require 'test_helper'

class ForumMessagesControllerTest < ActionController::TestCase
  setup do
    @forum_message = forum_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forum_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forum_message" do
    assert_difference('ForumMessage.count') do
      post :create, forum_message: { content: @forum_message.content, forum_thread_id: @forum_message.forum_thread_id, user_id: @forum_message.user_id }
    end

    assert_redirected_to forum_message_path(assigns(:forum_message))
  end

  test "should show forum_message" do
    get :show, id: @forum_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forum_message
    assert_response :success
  end

  test "should update forum_message" do
    patch :update, id: @forum_message, forum_message: { content: @forum_message.content, forum_thread_id: @forum_message.forum_thread_id, user_id: @forum_message.user_id }
    assert_redirected_to forum_message_path(assigns(:forum_message))
  end

  test "should destroy forum_message" do
    assert_difference('ForumMessage.count', -1) do
      delete :destroy, id: @forum_message
    end

    assert_redirected_to forum_messages_path
  end
end
