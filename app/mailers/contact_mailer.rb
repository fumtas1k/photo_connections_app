class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @user = user
    mail to: @user.email, subject: "アカウント登録通知: photo connections"
  end
  def notify_posting(user)
    @user = user
    mail to: @user.email, subject: "投稿通知: photo connections"
  end
end
