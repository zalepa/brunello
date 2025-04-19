require "test_helper"

class BlockTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(email: "test@example.com", password: "password")
  end
  test "when creating a user, two blocks are automatically created" do
    assert_equal 2, @user.blocks.count, "User should have two blocks created automatically"
  end

  test "a user should always have two blocks" do
    assert_equal 2, @user.blocks.count, "User should always have exactly two blocks"
  end

  test "a user cannot have more than two blocks" do
    @user.blocks.create!(name: "test", order: 12397)
    assert_not @user.valid?, "User should not be valid with more than two blocks"
  end
end
