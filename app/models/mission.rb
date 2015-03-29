class Mission < ActiveRecord::Base
  has_many :invitations
  has_many :teams, through: :invitations
end
