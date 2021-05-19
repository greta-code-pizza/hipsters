class EmailReply < ApplicationMailer
  def reply(comment, user)
    @comment = comment
    @user = user

    mail(
      :to => user.email,
      :subject => "[#{t('helpers.appli.hipster')}] #{t('mailers.reply.reply')} " <<
                  "#{comment.user.username} #{t('mailers.reply.on')} #{comment.story.title}"
    )
  end

  def mention(comment, user)
    @comment = comment
    @user = user

    mail(
      :to => user.email,
      :subject => "[#{t('helpers.appli.hipster')}] #{t('mailers.reply.mention')} " <<
                  "#{comment.user.username} #{t('mailers.reply.on')} #{comment.story.title}"
    )
  end
end
