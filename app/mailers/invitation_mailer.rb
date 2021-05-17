class InvitationMailer < ApplicationMailer
  def invitation(invitation)
    @invitation = invitation

    mail(
      to: invitation.email,
      subject: "[#{t('helpers.appli.hipster')}] #{t('mailers.inv.invited')}" <<
               "#{t('helpers.appli.hipster')}"
    )
  end
end
