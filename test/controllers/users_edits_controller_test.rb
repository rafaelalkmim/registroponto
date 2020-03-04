require 'test_helper'

class UsersEditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_edit = users_edits(:one)
  end

  test "should get index" do
    get users_edits_url
    assert_response :success
  end

  test "should get new" do
    get new_users_edit_url
    assert_response :success
  end

  test "should create users_edit" do
    assert_difference('UsersEdit.count') do
      post users_edits_url, params: { users_edit: {  } }
    end

    assert_redirected_to users_edit_url(UsersEdit.last)
  end

  test "should show users_edit" do
    get users_edit_url(@users_edit)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_edit_url(@users_edit)
    assert_response :success
  end

  test "should update users_edit" do
    patch users_edit_url(@users_edit), params: { users_edit: {  } }
    assert_redirected_to users_edit_url(@users_edit)
  end

  test "should destroy users_edit" do
    assert_difference('UsersEdit.count', -1) do
      delete users_edit_url(@users_edit)
    end

    assert_redirected_to users_edits_url
  end
end
