class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission
  enum status: [:yes, :maybe, :no]
  validates :mission_id, uniqueness: {scope: :user_id}
end