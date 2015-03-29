class Admin::InvitationsController < Admin::AdminController
  def create
    Mission.find(params[:mission_id]).teams << Team.find(params[:invitation][:team_id])
    redirect_to :back
  end

  def destroy
    Invitation.find_by(mission_id: params[:mission_id], team_id: params[:id]).destroy
    redirect_to :back
  end
end
