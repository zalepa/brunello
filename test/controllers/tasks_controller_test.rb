require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:brunello) # Use your users fixture
    @task = tasks(:morning) # Use your tasks fixture
    sign_in(@user)   # Ensure the user is logged in
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should filter tasks by params" do
    get tasks_url, params: { before: Date.today.to_s, completed: false }
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: { task: { block_id: @task.block_id, description: @task.description, scheduled_on: @task.scheduled_on, completed: false } }
    end

    assert_redirected_to day_url(Task.last.scheduled_on)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { block_id: @task.block_id, description: @task.description, scheduled_on: @task.scheduled_on, completed: true } }
    assert_redirected_to day_url(@task.scheduled_on)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end

    assert_redirected_to day_url(@task.scheduled_on)
  end
end
