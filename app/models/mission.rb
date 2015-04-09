class Mission < ActiveRecord::Base
  DETAILS_PARAMS = %w(side date_of_mission region invitation_for telephone primary_objective)

  amoeba do
    append name: '_cloned'
  end

  store_accessor :details, DETAILS_PARAMS
  has_many :invitations
  has_many :teams, through: :invitations
  has_many :participations
  enum status: [:yes, :maybe, :no]
  validates :name, :presence => true

  scope :for_team, -> (team) { joins(:invitations).where('invitations.team_id' =>  team.id) }
  scope :with_status_for, -> (user) { select("missions.*, participations.status").joins(:participations).where('participations.user_id' =>  user.id) }
end
