class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @projects = Project.all
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.save
    @project.users.create(id: :user_ids)

    #collection_ids.each do |user_id| # assuming collection_ids is an array
      #user = User.find(user_id)
      #@project.project_teams.create(:user_id => user)
      #@team = ProjectTeam.new (@project.project_teams.create(:user_id => user))
      #@team.save
    #end
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:projectId, :projectName, :description, :startDate, :endDate)
    end
    def collection_ids
      params.require(:project).permit(:user_id)
    end
end
