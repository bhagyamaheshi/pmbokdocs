class ProjectTeamsController < ApplicationController
  def index
    @project = Project.find(params[:projectId])
    @projectTeam = ProjectTeam.new
    #@test = @project.users
  end

  def create
    @project = Project.find(params[:project_team][:project_id])
    projectTeam = ProjectTeam.new
    projectTeam.user_id = params[:project_team][:user_id]
    projectTeam.project_id = params[:project_team][:project_id]
    
    projectTeam.save
    redirect_to project_path(@project)
    
    rescue => e
      flash[:error] = "The user is already exist"
      redirect_to project_path(@project)

  end

  private
  def project_params
    params.require(:project).permit(:id)
  end
  def projectTeam_params
    params.require(:project_team).permit(:project_id,:user_id)
  end
end
