class BanNotification < ApplicationMailer
  def notify(user, banner, reason)
    @banner = banner
    @reason = reason

    mail(
      :from => "#{@banner.username} <nobody@#{Rails.application.domain}>",
      :replyto => "#{@banner.username} <#{@banner.email}>",
      :to => user.email,
      :subject => "[#{t('helpers.appli.hipster')}] #{t('mailers.ban.banned')}"
    )
  end
end
