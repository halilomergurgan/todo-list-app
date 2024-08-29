require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user_params = {
      email: "newuser@example.com",
      password: "password",
      password_confirmation: "password"
    }
    @user = users(:one)
  end

  test "should create user" do
    assert_difference('User.count', 1) do
      post user_registration_url, params: { user: @user_params }
    end

    assert_redirected_to root_url
  end

  test "should not create user with invalid data" do
    @user_params[:email] = ""
    assert_no_difference('User.count') do
      post user_registration_url, params: { user: @user_params }
    end

    assert_response :ok
  end

  test "should log in user with valid credentials" do
    post user_session_path, params: { user: { email: @user.email, password: 'password' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should not log in user with invalid credentials" do
    post user_session_path, params: { user: { email: @user.email, password: 'wrongpassword' } }
    assert_response :success
  end
end
