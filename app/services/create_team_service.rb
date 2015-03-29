class CreateTeamService < BusinessProcess::Base
  needs :team

  def call
    create_team and assign_team_owner_as_team_member
  end

  private

  def create_team
    team.save
  end

  def assign_team_owner_as_team_member
    team.owner.update_column(:team_id, team.id)
  end
end
