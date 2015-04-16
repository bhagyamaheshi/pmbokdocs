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
    #content_type  "text/html"

    mail to: 'st115637@ait.asia', subject: '[PmBokDocs] New task for '+@project.projectName+' project'
  end

end
