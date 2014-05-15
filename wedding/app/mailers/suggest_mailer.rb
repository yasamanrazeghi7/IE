class SuggestMailer < ActionMailer::Base
  default from: "from@example.com"

  def suggestion_email(email , product_name, name, msg, sender_name)
  	@product_name = product_name
  	@name = name
  	@msg = msg
  	@sender_name = sender_name
  	mail(to:email, subject: 'پیشنهاد محصول از سایت عروس خانوم')
  end
end
