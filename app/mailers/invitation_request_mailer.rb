class InvitationRequestMailer < ApplicationMailer
  def invitation_request(invitation_request)
    @invitation_request = invitation_request

    mail(
      to: invitation_request.email,
      subject: "[#{t('helpers.appli.hipster')}] #{t('mailers.request.confirm')} " <<
      "#{t('mailers.request.confirm')}" << "#{t('helpers.appli.hipster')}"
    )
  end
end
