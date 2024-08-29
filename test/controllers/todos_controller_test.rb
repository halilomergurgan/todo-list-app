require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)

    post user_session_path, params: { user: { email: @user.email, password: 'password' } }
    follow_redirect!

    @todo = todos(:one)
    @todo_params = {
      title: "New Task",
      priority: "low",
      due_date: Date.tomorrow
    }
    @update_params = {
      title: "Updated Task",
      priority: "high",
      due_date: Date.tomorrow
    }
  end

  test "should create todo" do
    assert_difference('Todo.count', 1) do
      post todos_url, params: { todo: @todo_params }
    end

    assert_redirected_to todos_url
  end

  test "should not create todo with invalid data" do
    assert_no_difference('Todo.count') do
      post todos_url, params: { todo: { title: "" } }
    end

    assert_response :ok
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: @update_params }
    assert_redirected_to todos_url

    @todo.reload
    assert_equal "Updated Task", @todo.title
    assert_equal "high", @todo.priority
    assert_equal Date.tomorrow, @todo.due_date
  end

  test "should not update todo with invalid data" do
    patch todo_url(@todo), params: { todo: { title: "" } }
    assert_response :ok

    @todo.reload
    assert_not_equal "", @todo.title
  end

  test "should delete todo" do
    assert_difference('Todo.count', -1) do
      get delete_todo_url(@todo)
    end

    assert_redirected_to todos_url
    assert_not flash[:notice].empty?
  end

  test "should revert todo to incomplete" do
    @todo.update(completed: true)
    get revert_todo_url(@todo)

    @todo.reload
    assert_not @todo.completed
    assert_redirected_to todos_url
    assert_not flash[:notice].empty?
  end

  test "should mark todo as completed" do
    get complete_todo_url(@todo)

    @todo.reload
    assert @todo.completed
    assert_redirected_to todos_url
    assert_not flash[:notice].empty?
  end
end
