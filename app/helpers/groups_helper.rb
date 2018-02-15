module GroupsHelper

  def winner_series_style(series, team)
    if team === 1
      other_team_num = 0
    else
      other_team_num = 1
    end

    if series.completed?
      passed_in_team_id = series.teams[team].id
      other_team_id = series.teams[other_team_num].id

      if series.series_matches.where(winning_team_id: passed_in_team_id).all.count > series.series_matches.where(winning_team_id: other_team_id).all.count
        'success'
      else
        'danger'
      end
    end
  end
end
