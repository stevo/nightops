class Invitation < ActiveRecord::Base
  belongs_to :team
  belongs_to :mission
end
