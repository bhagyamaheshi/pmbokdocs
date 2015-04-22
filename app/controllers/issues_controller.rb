class IssuesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @project = Project.find(params[:projectId])
    @issues = Issue.where('project_id = ?', params[:projectId]).order('created_at DESC')
    #@acivity = Activity.find(params[:projectId])
    #@issues = Issue.find(@activity.id)
    @issue = Issue.new
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
    @issue = Issue.new
    @issue.issueName = params[:issue][:issueName]
    @issue.project_id = params[:issue][:project_id]
    @issue.save
      Notification.issue_creation_notification(@issue).deliver
    redirect_to issues_path(projectId: params[:issue][:projectId])
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
