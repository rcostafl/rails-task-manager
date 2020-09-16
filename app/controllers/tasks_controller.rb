class TasksController < ApplicationController
  # list all tasks
  # Create a view with name index.html.erb
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    # function migrated to before_action (private method set_restaurant)
    #@task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    new_task = Task.create(task_params)
    redirect_to task_path(new_task)
  end

  def edit
    # function migrated to before_action (private method set_restaurant)
    #@task = Task.find(params[:id])
  end

  def update
    # function migrated to before_action (private method set_restaurant)
    #@task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    # function migrated to before_action (private method set_restaurant)
    #@task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_restaurant
    @task = Task.find(params[:id])
  end
end
