class Mission < ActiveRecord::Base
  has_many :invitations
  has_many :teams, through: :invitations
  has_many :participations
  enum status: [:yes, :maybe, :no]

  scope :for_team, -> (team) { joins(:invitations).where('invitations.team_id' =>  team.id) }
  scope :with_status_for, -> (user) { select("missions.*, participations.status").joins(:participations).where('participations.user_id' =>  user.id) }

end
