class IssuesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @project = Project.find(params[:projectId])
    @issue = Issue.new
    @issues = Issue.where('project_id = ?', params[:projectId])
    respond_with(@issues)
  end

  def show
    respond_with(@issue)
  end

  def new
    @issue = Issue.new
    respond_with(@issue)
  end

  def edit
  end

  def create
    @project = Project.find(params[:issue][:project_id])
    @user = User.find (current_user.id)
    @issue = Issue.new(issue_params)
    @issue.save
    @issue.issueName = params[:issue][:issueName]
    @issue.project_id = params[:issue][:project_id]
    @issue.save
    Notification.issue_creation_notification(@issue,@project,@user).deliver
    redirect_to issues_path(:projectId => params[:issue][:project_id])
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
      params.require(:issue).permit(:issueId, :issueName, :project_id)
    end
end
