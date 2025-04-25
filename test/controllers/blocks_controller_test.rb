require "test_helper"

class BlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:brunello) # Assuming you have a fixture for users
    @block = @user.blocks.first # Scope blocks to the logged-in user
    sign_in @user # Assuming Devise or a similar authentication system
  end

  test "should get index" do
    get blocks_url
    assert_response :success
  end

  test "should get new" do
    get new_block_url
    assert_response :success
  end

  test "should create block" do
    assert_no_difference("@user.blocks.count") do
      post blocks_url, params: { block: { name: "New Block", order: 100, user_id: @user.id } }
    end

    assert_response 404
  end

  test "should show block" do
    get block_url(@block)
    assert_response :success
  end

  test "should get edit" do
    get edit_block_url(@block)
    assert_response :success
  end

  test "should update block" do
    patch block_url(@block), params: { block: { name: "Updated Name", order: @block.order, user_id: @user.id } }
    assert_redirected_to block_url(@block)
  end

  test "should destroy block" do
    # Ensure the user starts with exactly two blocks
    assert_equal 2, @user.blocks.count, "User should have exactly two blocks before deletion"

    assert_no_difference("@user.blocks.count") do
      delete block_url(@block)
    end

    assert_response 404
  end
end
