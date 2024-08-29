class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :delete, :complete, :revert]

  def index
    @todos = current_user.todos.order(priority: :desc, due_date: :asc)
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      flash[:notice] = "Todo was successfully created."
      redirect_to todos_path
    else
      render :new
    end
  end

  def edit
    logger.debug "Attempting to edit Todo with ID: #{@todo.id}"
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = "Todo was successfully updated."
      redirect_to todos_path
    else
      render :edit
    end
  end

  def delete
    @todo.destroy
    flash[:notice] = "Todo was successfully deleted."
    redirect_to todos_path
  end

  def complete
    @todo.update(completed: true)
    flash[:notice] = "Todo was successfully marked as completed."
    redirect_to todos_path
  end

  def filter
    status = params[:status]
    @todos = case status
             when 'completed'
               current_user.todos.where(completed: true)
             when 'pending'
               current_user.todos.where(completed: false)
             else
               current_user.todos
             end

    render partial: 'todo_items', locals: { todos: @todos }
  end

  def revert
    @todo.update(completed: false)
    flash[:notice] = "Todo was successfully marked as incomplete."
    redirect_to todos_path
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :due_date, :priority, :completed)
  end
end
