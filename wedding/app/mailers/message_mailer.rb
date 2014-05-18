class MessageMailer < ActionMailer::Base
  default from: "from@example.com"
  def message_email(r_email, sub, msg , s_name)
  	@msg = msg
  	@sender_name = s_name
  	mail(to:r_email, subject: sub)
  end
end
