class Notification < ActionMailer::Base
  default from: "isdm.pmbokdocs@gmail.com"

  def adding_team_member_notification(project,user)
    @project_mailer = project
    @user_mailer = user
    mail to: 'st116391@ait.asia', subject: '[PmBokDocs]You are assigned to '+@project_mailer.projectName+' project'
  end

  def assigning_team_member_notification
    #
    # For sending email notifying an assigned task(Project name, related Document category, deadline, supervisor name)
    #
  end

end
