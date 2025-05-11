require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should create a valid user" do
    user = User.new(email: "test@example.com", password: "password", password_confirmation: "password")
    assert user.valid?
  end

  test "should not create a user without an email" do
    user = User.new(password: "password123", password_confirmation: "password123")
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test "should not create a user with invalid email" do
    user = User.new(email: "invalid_email", password: "password123", password_confirmation: "password123")
    assert_not user.valid?
    assert_includes user.errors[:email], "is invalid"
  end

  test "should not create a user without a password" do
    user = User.new(email: "test@example.com")
    assert_not user.valid?
    assert_includes user.errors[:password], "can't be blank"
  end

  test "should not create a user with mismatched password confirmation" do
    user = User.new(email: "test@example.com", password: "password123", password_confirmation: "wrongpassword")
    assert_not user.valid?
    assert_includes user.errors[:password_confirmation], "doesn't match Password"
  end

  test "should not create a user with a short password" do
    user = User.new(email: "test@example.com", password: "short", password_confirmation: "short")
    assert_not user.valid?
    assert_includes user.errors[:password], "is too short (minimum is 6 characters)"
  end

  test "should provide overdue tasks" do
    user = users(:brunello)
    @overdue_task = user.tasks.create(description: "Test", scheduled_on: Date.yesterday, block: blocks(:morning), completed: false)
    assert user.overdue.any?
    assert_equal user.overdue.count, 1
    assert_equal user.overdue.first, @overdue_task
  end
end
