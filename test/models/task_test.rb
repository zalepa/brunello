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

  test "#overdue should list overdue tasks" do
    @overdue_task = @user.tasks.create(description: "Test", scheduled_on: Date.yesterday, block: @block, completed: false)
    @overdue = Task.overdue(@user.id)
    assert @overdue.any?
    assert_equal @overdue.count, 1
    assert_equal @overdue.first, @overdue_task
  end
end
