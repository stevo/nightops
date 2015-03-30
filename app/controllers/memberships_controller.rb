class MembershipsController < AuthorizedController
  def create
    User.find(params[:membership][:member_id]).update_attribute(:team_id, params[:team_id])
    redirect_to :back
  end

  def destroy
    User.find(params[:id]).update_attribute(:team_id, nil)
    redirect_to :back
  end
end
