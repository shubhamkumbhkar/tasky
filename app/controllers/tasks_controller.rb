class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update show destroy]
  before_action :set_project, only: %i[edit update new create]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = @project.tasks.create(task_params)
    @task.description.body = params[:task][:description]
    if @task.save
      render "projects/show"
    else
      render "new"
    end
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      @task.documents.attach(params[:task][:documents])
      @task.description.update(body:params[:task][:description])
      render "tasks/show"
    end
  end

  def destroy
    @task.destroy
    redirect_to projects_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:name, :status, :description, :assignee_id, :reporter_id, documents: [])
  end
end
