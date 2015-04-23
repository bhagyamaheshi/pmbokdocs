class IssuesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @project = Project.find(params[:projectId])
    @issues = Issue.where('project_id = ?', params[:projectId]).order('created_at DESC')
    @issue = Issue.new
    respond_with(@issues)
  end

  def show
    respond_with(@issue)
  end

  def new
    document_category_id = params[:document_category_id]
    activity_id = params[:activity_id]
    project_id = params[:projectId]
    user_id = params[:user_id]
    status = params[:status]

    document_category_name = DocumentCategory.find(document_category_id).categoryName
    user_name = User.find(user_id).firstName

    @issue = Issue.new
    @issue.issueName = 'Issue for '+document_category_name+' created by '+user_name
    @issue.project_id = project_id
    @issue.activity_id = activity_id
    @issue.status = status

    @project = Project.find(project_id)
    @user = User.find(user_id)

    @issue.save
    Activity.destroy(activity_id)

    Notification.issue_creation_notification(@issue,@project,@user).deliver
    redirect_to issues_path(:projectId => project_id)
  end

  def edit
  end


  def create
=begin
    @project = Project.find(params[:issue][:project_id])
    @user = User.find (current_user.id)
    @issue = Issue.new()
    @issue.issueName = params[:issue][:issueName]
    @issue.project_id = params[:issue][:project_id]
    @issue.status = params[:issue][:status]
    @issue.save
=end

=begin
    document_category_id = params[:document_category_id]
    activity_id = params[:activity_id]
    project_id = params[:projectId]
    user_id = params[:user_id]
    status = params[:status]

    document_category_name = DocumentCategory.find(document_category_id).categoryName

    @issue = Issue.new
    @issue.issueName = document_category_name
    @issue.project_id = project_id
    @issue.activity_id = activity_id
    @issue.status = status

    @project = Project.find(project_id)
    @user = User.find(user_id)

    @issue.save

    Notification.issue_creation_notification(@issue,@project,@user).deliver
    redirect_to issues_path(:projectId => project_id)
=end

    #respond_with(@issue)
  end

  def update
    @issue.update(issue_params)
    respond_with(@issue)
  end

  def destroy
    @issue.destroy
    respond_with(@issue)
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:issueId, :issueName, :project_id, :status)
    end
end
