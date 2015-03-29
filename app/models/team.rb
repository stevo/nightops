class Team < ActiveRecord::Base
  belongs_to :owner, class_name: User
  has_many :users
  has_many :invitations
  has_many :missions, through: :invitations

  validates :name, uniqueness: true, presence: true

end
