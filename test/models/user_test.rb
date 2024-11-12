require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should save valid user" do
    user = User.new(
      name: "Test",
      last_name: "User",
      email: "test@example.com",
      phone: "1234567890",
      address: "123 Main St",
      comments: "Test comments"
    )
    assert user.save
  end

  test "should not save user without name" do
    user = User.new(last_name: "User")
    assert_not user.save
  end
end
