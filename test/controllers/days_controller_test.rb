require "test_helper"

class DaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:brunello) # Assuming you have a fixture for users
    sign_in @user       # Ensure the user is signed in
  end

  test "should show tasks scheduled for today when logged in" do
    get day_url(Date.today) # Assuming your route expects a date parameter
    assert_response :success
  end

  test "should not show tasks scheduled for today when logged out" do
    sign_out @user
    get day_url(Date.today) # Assuming your route expects a date parameter
    assert_redirected_to new_user_session_path
  end
end
