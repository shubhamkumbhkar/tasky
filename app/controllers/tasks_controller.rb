class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  def new
    @task = Task.new
    @project = Project.find(params[:project_id])

  end
  def create
    #byebug
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      render "projects/show"
    else
      render "new"
    end
  end
  def show
    #byebug
    @task =Project.find(params[:project_id]).tasks.find(params[:id]) 
    #Project.find(params[:project_id]).tasks.find(params[:id])
  end
  def edit
    @project = Project.find(params[:project_id])
    @task =Project.find(params[:project_id]).tasks.find(params[:id]) 
  end
  def update
    @project = Project.find(params[:project_id])
    @task =Project.find(params[:project_id]).tasks.find(params[:id])
    if @task.update(task_params)
      render "tasks/show"
    else
    end
  end
  def destroy
    @project = Project.find(params[:project_id])

    @task =Project.find(params[:project_id]).tasks.find(params[:id])
    if @task.destroy
      render "projects/show"
    else
    end
  end


  private
  def task_params
    params.require(:task).permit(:name, :status, :description)
  end
  
end
