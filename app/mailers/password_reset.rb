class PasswordReset < ApplicationMailer
  def password_reset_link(user, ip)
    @user = user
    @ip = ip

    mail(
      :to => user.email,
      :subject => "[#{t('helpers.appli.hipster')}] #{('mailers.reset.reset')}"
    )
  end
end
