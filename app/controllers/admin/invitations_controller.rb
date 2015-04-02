class Admin::InvitationsController < Admin::AdminController
  expose(:team) { Team.find(params[:invitation][:team_id]) }
  expose(:mission) { Mission.find(params[:mission_id]) }

  def create
    InviteTeamToMission.call(self)
    redirect_to :back
  end

  def destroy
    Invitation.find_by(mission_id: params[:mission_id], team_id: params[:id]).destroy
    redirect_to :back
  end
end
