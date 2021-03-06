class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @project = Project.find(params[:projectId])
    @user = @project.users
    @activity = Activity.new
    @allactivities = Activity.where('project_id = ?', params[:projectId])
    @activities = Activity.where('project_id = ?  AND user_id= ?', params[:projectId], current_user.id )
    #respond_with(@activities)
  end

  def show
    #respond_with(@activity)
    @project = Project.find(params[:project_id])
    @documentCategory = DocumentCategory.find(params[:document_category_id])
    @document = Document.new
    @projectId = params[:project_id]
    @activityId = params[:activity_id]
    @documentCategoryId = params[:document_category_id]
    @userId = params[:user_id]
    @status = params[:status]

    Activity.update(@activityId, :status => @status)

  end

  def new
    @project = Project.find(params[:projectId])
    @user = @project.users
    @activity = Activity.new
    respond_with(@activity)
  end

  def edit
  end

  def create
    @project = Project.find(params[:activity][:project_id])
    @activity = Activity.new(activity_params)
    @activity.assignerID = current_user.id
    @activity.priority = params[:priority]
    document_category = DocumentCategory.find(params[:activity][:documentcategories_id])
    superviser_user = User.find(current_user.id)
    assigned_user = User.find(params[:activity][:user_id])

    @activity.save
    Notification.assigning_team_member_notification(@activity, @project).deliver
    redirect_to activities_path(:projectId => params[:activity][:project_id])
  end

  def update
    @activity.update(activity_params)
    respond_with(@activity)
  end

  def destroy
    @activity.destroy
    respond_with(@activity)
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:activityId, :activityName, :status, :activity_category_id, :documentcategories_id, :dueDate,:priority, :user_id, :project_id, :projectId,:activity_id)
    end
end
