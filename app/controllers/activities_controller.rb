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
    respond_with(@activities)
  end

  def show
    respond_with(@activity)
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
    @activity = Activity.new(activity_params)
    @activity.assignerID = current_user.id
    @activity.priority = params[:priority]
    @activity.save
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
      params.require(:activity).permit(:activityId, :activityName, :status, :activity_category_id, :documentcategories_id, :dueDate,:priority, :user_id, :project_id, :projectId)
    end
end
