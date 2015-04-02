class InviteTeamToMission < BusinessProcess::Base
  needs :team
  needs :mission

  def call
    add_team_to_mission and send_invitation_emails
  end

  private

  def add_team_to_mission
    mission.teams << team
  end

  def send_invitation_emails
    team.users.each do |user|
      ::TeamMailer.invitation_notification(user, mission.external_url).deliver
    end
  end
end