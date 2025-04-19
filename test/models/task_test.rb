require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = tasks(:morning)
    @block = @task.block
    @user = @task.user
  end

  test "should be valid with valid attributes" do
    assert @task.valid?
  end

  test "should not be valid without a user" do
    @task.user = nil
    assert_not @task.valid?
  end

  test "should not be valid without a block" do
    @task.block = nil
    assert_not @task.valid?
  end
end
