class ContactMailer < ApplicationMailer
  def contact_mail(user)
    @user = user
    mail to: @user.email, subject: "アカウント登録通知: photo_connections"
  end
end
