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
      @task.documents.attach(params[:task][:documents])
      @task.reporter_id = current_user.id
      @task.description.body = params[:description]
      #byebug
      if @task.save
        render "projects/show"
      else
        render "new"
      end
  end
  def show
    #byebug
    @task =Project.find(params[:project_id]).tasks.find(params[:id]) 
  end
  def edit
    #byebug
    @project = Project.find(params[:project_id])
    @task =Project.find(params[:project_id]).tasks.find(params[:id]) 
  end
  def update
    #byebug
    @project = Project.find(params[:project_id])
    @task =Project.find(params[:project_id]).tasks.find(params[:id])
    if @task.update(task_params)
      @task.documents.attach(params[:task][:documents])
      @task.description.update(body:params[:description])
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
    params.require(:task).permit(:name, :status, :description, :assignee_id, documents: [])
  end
  
end
