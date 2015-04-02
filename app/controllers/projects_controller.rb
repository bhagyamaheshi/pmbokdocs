class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @project = Project.new

    if params[:search]
      @projects = Project.where("\"projectName\" like (?)", "%#{params[:search].upcase}%")
    else
      @user = User.find(current_user.id)
      @projects = @user.projects.all.order('created_at DESC')
      respond_with(@projects)
    end

  end

  def show
    @projectTeam = ProjectTeam.new
    @projectTeamList = User.all.where.not(id: @project.users.collect { |u| u.id } )
    #respond_with(@project)
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

    @project.project_teams.create(:user_id => current_user.id ,:project_id => @project.id)

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
      params.require(:project).permit(:projectName, :description, :startDate, :endDate)
    end
    def collection_ids
      params.require(:project).permit(:user_id)
    end
end
