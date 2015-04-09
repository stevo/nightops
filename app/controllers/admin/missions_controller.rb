class Admin::MissionsController < Admin::AdminController
  expose(:teams_available_to_invite) { Team.where.not(id: mission.team_ids) }
  expose(:mission, attributes: :mission_params, strategy: DecoratorStrategy)
  expose(:missions)


  def create
    if params[:clone]
      missions.find(params[:clone]).amoeba_dup.save
    else
      return render :new unless mission.save
    end

    redirect_to admin_missions_path
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
