class TeamsController < AuthorizedController
  expose(:team, attributes: :team_params)
  expose(:teams, ancestor: :current_user)

  expose(:users_without_teams) { User.where(team_id: nil) }
end


