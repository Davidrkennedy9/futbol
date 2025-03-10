module LeagueStatistics

  def count_of_teams
    teams.count
  end

  def best_offense
    team_goals = Hash.new do |hash, key| 
      hash[key] = { total_goals: 0, games_played: 0 }
    end

    @game_teams.each do |game_team|
      team_goals[game_team.team_id][:total_goals] += game_team.goals
      team_goals[game_team.team_id][:games_played] += 1
    end

    best_team_id = team_goals.max_by do |team_id, stats| 
      stats[:total_goals] / stats[:games_played].to_f
    end.first

    team = @teams.find do |team| 
      team.team_id == best_team_id 
    end
      team.teamname
  end

  def worst_offense
    team_goals = Hash.new do |hash, key| 
      hash[key] = { total_goals: 0, games_played: 0 }
    end

    @game_teams.each do |game_team|
      team_goals[game_team.team_id][:total_goals] += game_team.goals
      team_goals[game_team.team_id][:games_played] += 1
    end

    worst_team_id = team_goals.min_by do |team_id, stats| 
      stats[:total_goals] / stats[:games_played].to_f
    end.first

    team = @teams.find do |team| 
      team.team_id == worst_team_id 
    end
    team.teamname
  end

  def highest_scoring_visitor
    away_team_goals = Hash.new do |hash, key| 
      hash[key] = { total_goals: 0, games_played: 0 }
    end

    @game_teams.each do |game_team|
      if game_team.hoa == "away"
        away_team_goals[game_team.team_id][:total_goals] += game_team.goals
        away_team_goals[game_team.team_id][:games_played] += 1
      end
    end

    best_away_team_id = away_team_goals.max_by do |team_id, stats| 
      stats[:total_goals] / stats[:games_played].to_f
    end.first

    team = @teams.find do |team| 
      team.team_id == best_away_team_id 
    end
    team.teamname
  end

  def highest_scoring_home_team
    home_team_goals = Hash.new do |hash, key| 
      hash[key] = { total_goals: 0, games_played: 0 }
    end

    @game_teams.each do |game_team|
      if game_team.hoa == "home"
        home_team_goals[game_team.team_id][:total_goals] += game_team.goals
        home_team_goals[game_team.team_id][:games_played] += 1
      end
    end

    best_home_team_id = home_team_goals.max_by do |team_id, stats| 
      stats[:total_goals] / stats[:games_played].to_f
    end.first

    team = @teams.find do |team| 
      team.team_id == best_home_team_id 
    end
    team.teamname
  end

  def lowest_scoring_visitor
    away_team_goals = Hash.new do |hash, key| 
      hash[key] = { total_goals: 0, games_played: 0 }
    end

    @game_teams.each do |game_team|
      if game_team.hoa == "away"
        away_team_goals[game_team.team_id][:total_goals] += game_team.goals
        away_team_goals[game_team.team_id][:games_played] += 1
      end
    end

    worst_away_team_id = away_team_goals.min_by do |team_id, stats| 
      stats[:total_goals] / stats[:games_played].to_f
    end.first

    team = @teams.find do |team| 
      team.team_id == worst_away_team_id 
    end
    team.teamname
  end

  def lowest_scoring_home_team
    home_goals_by_team = Hash.new { |hash, key| hash[key] = { total_goals: 0, games_played: 0 } }
  
    @games.each do |game|
    team_id = game.home_team_id 
    goals = game.home_goals.to_i 
  
    home_goals_by_team[team_id][:total_goals] += goals
    home_goals_by_team[team_id][:games_played] += 1
    end
  
    average_home_scores = {}
    home_goals_by_team.each do |team_id, data|
      average_home_scores[team_id] = data[:total_goals].to_f / data[:games_played]
    end
  
    lowest_scoring_team = average_home_scores.min_by do |team_id, avg_score|
      avg_score  
    end
    
    lowest_scoring_team_id = lowest_scoring_team[0]
  
    lowest_scoring_team = @teams.find do |team|
       team.team_id == lowest_scoring_team_id 
    end
    lowest_scoring_team.teamname 
  end
end