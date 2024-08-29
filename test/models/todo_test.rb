require "test_helper"

class TodoTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @todo = Todo.new(title: "Test Task", priority: "medium", due_date: Date.today, user: @user)
  end

  test "should be valid" do
    assert @todo.valid?
  end

  test "title should be present" do
    @todo.title = "   "
    assert_not @todo.valid?
  end

  test "title should not be too short" do
    @todo.title = "aa"
    assert_not @todo.valid?
  end

  test "due_date is optional" do
    @todo.due_date = nil
    assert @todo.valid?
  end
end
