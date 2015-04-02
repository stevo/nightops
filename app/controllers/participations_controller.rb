class ParticipationsController < ApplicationController
  def update
    Participation.where(user_id: current_user.id, mission_id: params[:mission_id]).first_or_initialize.tap do |participation|
      participation.status = params[:status]
    end.save!
    redirect_to :back
  end
end