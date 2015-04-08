class Admin::MissionsController < Admin::AdminController
  expose(:teams_available_to_invite) { Team.where.not(id: mission.team_ids) }
  expose(:mission, attributes: :mission_params)
  expose(:missions)


  def create
    if mission.save
      redirect_to admin_missions_path
    else
      render :new
    end
  end

  def update
    if mission.save
      redirect_to admin_missions_path
    else
      render :edit
    end
  end

  def destroy
    mission.destroy
    redirect_to admin_missions_path
  end

  private

  def mission_params
    params.require(:mission).permit(:name, :start_at, :external_url, :details, *Mission::DETAILS_PARAMS.map(&:to_sym))
  end
end
