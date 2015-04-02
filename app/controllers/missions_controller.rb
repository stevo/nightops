class MissionsController < AuthorizedController
  expose(:missions) { Mission.for_team(current_user.team).with_status_for(current_user) }

  def index
  end
end
