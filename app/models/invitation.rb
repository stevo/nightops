class Invitation < ActiveRecord::Base
  belongs_to :team
  belongs_to :mission
  validates :mission_id, uniqueness: {scope: :team_id}
end
