class EmailMessage < ApplicationMailer
  def notify(message, user)
    @message = message
    @user = user

    mail(
      :to => user.email,
      :subject => "[#{t('helpers.appli.hipster')}] #{t('mailers.email.private')}" <<
                  "#{message.author_username}: #{message.subject}"
    )
  end
end
