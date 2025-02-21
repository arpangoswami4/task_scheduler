class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :update, :show, :destroy]

  def index
    @tasks = Task.apply_filter(params.slice(:status, :search_term)).apply_sorting(params.slice(:sort, :direction), ["title", "description", "due_date"]).page(params[:page])
    @tasks = policy_scope(@tasks)
    authorize @tasks
  end

  def show
    authorize @task
  end

  def new
    @task = current_user.tasks.new
    authorize @task
  end

  def create
    @task = current_user.tasks.new(task_params)
    authorize @task
    if @task.save
    # redirect_to task_path(task.id)
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit
    authorize @task
  end

  def update
    authorize @task
    if @task.update(task_params)
      redirect_to task_path(@task.id)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @task
    @task.destroy
    redirect_to root_path
  end

  def user_tasks
    @tasks = current_user.tasks.apply_filter(params.slice(:status, :search_term)).apply_sorting(params.slice(:sort, :direction), ["title", "description", "due_date"]).page(params[:page])
    @tasks = policy_scope(@tasks)
    authorize @tasks
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status)
  end

end
