class Notification < ActionMailer::Base
  default from: "isdm.pmbokdocs@gmail.com"

  def adding_team_member_notification(project,user)
    @project_mailer = project
    @user_mailer = user
    mail to: 'st116391@ait.asia', subject: '[PmBokDocs]You are assigned to '+@project_mailer.projectName+' project'
  end

  def assigning_team_member_notification(activity, project)
    @activity = activity
    @document_category = DocumentCategory.find(activity.documentcategories_id)
    @supervisor_user = User.find(activity.assignerID)
    @user = User.find(activity.user_id)

    @project = project

    mail to: 'st116391@ait.asia', subject: '[PmBokDocs] New task for '+@project.projectName+' project'
  end

  def issue_creation_notification(issue, project, user)
    @project= project
    @user = user
    #@user_mailer = user
    @issue = issue
    mail to: 'st116391@ait.asia', subject: '[PmBokDocs]Informing an issue in Project'
  end


end
