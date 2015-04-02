class TeamMailer < ApplicationMailer
  def invitation_notification(user, url)
    @user = user
    @url = url
    mail(to: @user.email, subject: 'You have been invited to an event!')
  end
end
