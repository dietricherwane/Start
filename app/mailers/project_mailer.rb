class ProjectMailer < ActionMailer::Base
  default from: "START CI"

  def notification(project_info)
    @project_info = project_info

    mail(to: "dietricherwane@yahoo.fr", subject: 'Soumission de projet')
  end
end
