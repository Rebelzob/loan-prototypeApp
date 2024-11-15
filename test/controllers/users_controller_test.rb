require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { 
        name: "Test User",
        last_name: "Test LastName",
        email: "test@example.com",
        phone: "1234567890" } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: {
      name: "Updated name", 
      last_name: "Updated lastname", 
      email: "Updated@example.com", 
      phone: "0987654321", 
      address: "456 Updated St", 
      comments: "Updated comments" 
    } }
    assert_redirected_to user_url(@user)
    @user.reload
    assert_equal "Updated name", @user.name
    assert_equal "Updated lastname", @user.last_name
    assert_equal "Updated@example.com", @user.email
    assert_equal "0987654321", @user.phone
    assert_equal "456 updated st", @user.address
    assert_equal "Updated comments", @user.comments
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
