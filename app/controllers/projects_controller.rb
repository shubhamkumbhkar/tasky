class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end
  def show
    @project = Project.find(params[:id])
  end
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.documents.attach(params[:project][:documents])
    if @project.save
      render "projects/index"
    else
      #byebug
      render "projects/new"
    end
  end
  def edit
    @project = Project.find(params[:id])
  end
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      @project.documents.attach(params[:project][:documents])
      render "projects/index"
    else
      redirect_to @project
    end
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    render "projects/index"
  end

  private
    def project_params
      params.require(:project).permit(:name, :status, :description, documents: [])
    end
end
