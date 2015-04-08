class ProjectTeamsController < ApplicationController
  def index
    @project = Project.find(params[:projectId])
    @projectTeam = ProjectTeam.new
  end

  def create
    @project = Project.find(params[:project_team][:project_id])
    projectTeam = ProjectTeam.new
    projectTeam.user_id = params[:project_team][:user_id]
    projectTeam.project_id = params[:project_team][:project_id]
    @user = User.find(projectTeam.user_id)
    begin
        projectTeam.save
        Notification.adding_team_member_notification(@project,@user).deliver
    rescue Exception => e
        flash[:error] = "The user is already exist"
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
