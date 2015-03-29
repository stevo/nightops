class Admin::TeamsController < Admin::AdminController
  expose(:team, attributes: :team_params)
  expose(:teams)

  def create
    if CreateTeamService.call(self)
      redirect_to admin_teams_path
    else
      render :new
    end
  end

  def update
    if team.save
      redirect_to admin_teams_path
    else
      render :edit
    end
  end

  def destroy
    team.destroy
    redirect_to admin_teams_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :owner_id)
  end
end
