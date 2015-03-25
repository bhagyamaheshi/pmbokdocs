class ProjectTeamsController < ApplicationController
  def index
    @project = Project.find(params[:projectId])
    @projectTeam = ProjectTeam.new
  end

  def create
    @project = Project.find(params[:project_team][:project_id])
    #@team = ProjectTeam.new(:user_id => project_params[:id],:project_id => params[:projectId])
    if @team = @project.project_teams.create(:user_id => params[:project_team][:user_id],:project_id => params[:project_team][:project_id])
      :flash[:notice] = "The user is already exist!!"
    else
      @team.save
    end
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
