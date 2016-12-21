class ApplicationMailer < ActionMailer::Base
  default from: "longlyduc@gmail.com"
  layout "mailer"
  include ApplicationHelper

  def accepted_request_club user
    @user = user
    mail(to: @user.email,
      subject: "Your request has been approve!")
  end

  def sent_request_club
    mail(to: admin.email, subject: "An request has been sent")
  end
end
