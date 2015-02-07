class ContactMailer < ActionMailer::Base
  default from: "START CI"

  def notification(contact_info)
    @contact_info = contact_info
    subject = (contact_info.subject.name rescue "")

    mail(to: "dietricherwane@yahoo.fr", subject: subject)
  end
end
