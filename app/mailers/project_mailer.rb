class ProjectMailer < ActionMailer::Base
  default from: "START CI"

  def notification(project_info)
    @project_info = project_info

    mail(to: ["dietricherwane@yahoo.fr", "likouassi@yahoo.com", "drseka@hotmail.com", "mbinde2006@yahoo.com", "lacitadelle15@yahoo.fr", "hyeboua@yahoo.fr", "info@start-ci.com", "infos@start-ci.com"], subject: 'Soumission de projet')
  end
end
