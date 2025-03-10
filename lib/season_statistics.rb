
module SeasonStatistics
  def winningest_coach(season_id)
    season_games = @games.find_all do |game|
       game.season == season_id
    end
    
    season_game_ids = season_games.map do |game| 
        game.game_id 
    end
  
    season_game_teams = @game_teams.find_all do |game_team| 
      season_game_ids.include?(game_team.game_id) 
    end
    
    coach_stats = Hash.new do |hash, key|
      hash[key] = { wins: 0, total_games: 0 }
    end
  
    season_game_teams.each do |game_team|
      coach = game_team.head_coach
      coach_stats[coach][:total_games] += 1
      if game_team.result == "WIN"
        coach_stats[coach][:wins] += 1
      end
    end
  
    best_coach = coach_stats.max_by do |coach, stats|
      stats[:wins].to_f / stats[:total_games]
    end
    best_coach&.first
  end

  def worst_coach(season_id)
    season_games = @games.find_all do |game| 
      game.season == season_id 
    end

    season_game_ids = season_games.map do |game|
       game.game_id 
    end
  
    season_game_teams = @game_teams.select do |game_team| 
      season_game_ids.include?(game_team.game_id) 
    end
  
    coach_stats = Hash.new { |hash, key| hash[key] = { wins: 0, total_games: 0 } }
  
    season_game_teams.each do |game_team|
      coach = game_team.head_coach
      coach_stats[coach][:total_games] += 1
      coach_stats[coach][:wins] += 1 if game_team.result == "WIN"
    end
  
    worst_coach = coach_stats.min_by do |coach, stats|
      stats[:wins].to_f / stats[:total_games]
    end
    worst_coach&.first
  end

  def most_accurate_team(season_id) 
    season_games = @games.select do |game| 
      game.season == season_id 
    end
  
    season_game_ids = season_games.map do |game| 
      game.game_id 
    end
  
    season_game_teams = @game_teams.find_all do |game_team| 
      season_game_ids.include?(game_team.game_id) 
    end
  
    team_stats = Hash.new { |hash, key| hash[key] = { goals: 0, shots: 0 } }
  
    season_game_teams.each do |game_team|
      team_id = game_team.team_id
      team_stats[team_id][:goals] += game_team.goals.to_i
      team_stats[team_id][:shots] += game_team.shots.to_i
    end
    
    best_team = team_stats.max_by do |team_id, stats| 
      stats[:goals].to_f / stats[:shots] 
    end
  
    most_accurate_team_id = best_team ? best_team[0] : nil
  
    team = @teams.find do |team| 
      team.team_id == most_accurate_team_id 
    end
    
    if team
      team.teamname
    else
      nil
    end
  end

  def least_accurate_team(season_id)
    season_games = @games.find_all do  |game| 
      game.season == season_id 
    end
  
    season_game_ids = season_games.map do |game|
       game.game_id 
    end
  
    season_game_teams = @game_teams.find_all do  |game_team| 
      season_game_ids.include?(game_team.game_id) 
    end
  
    team_stats = Hash.new { |hash, key| hash[key] = { goals: 0, shots: 0 } }
  
    season_game_teams.each do |game_team|
      team_id = game_team.team_id
      team_stats[team_id][:goals] += game_team.goals.to_i
      team_stats[team_id][:shots] += game_team.shots.to_i
    end
  
    worst_team = team_stats.min_by do |team_id, stats|
       stats[:goals].to_f / stats[:shots] 
    end
  
    least_accurate_team_id = worst_team ? worst_team[0] : nil
  
    team = @teams.find do |team| 
      team.team_id == least_accurate_team_id 
    end
    
    if team
      team.teamname
    else
      nil
    end
  end

  def most_tackles(season_id) 
    game_ids_for_season = []
    
    @games.each do |game|
      if game.season == season_id 
        game_ids_for_season << game.game_id 
      end
    end
  
    tackles_by_team = Hash.new(0)
  
    @game_teams.each do |game_team|
      if game_ids_for_season.include?(game_team.game_id) 
        team_id = game_team.team_id 
        tackles = game_team.tackles.to_i 
        tackles_by_team[team_id] += tackles
      end
    end
  
    most_tackles_team = tackles_by_team.max_by do |team_id, tackles|
     tackles  
    end
  
    most_tackles_team_id = most_tackles_team[0]
  
    team_with_most_tackles = nil
    @teams.each do |team|
      if team.team_id == most_tackles_team_id # 
        team_with_most_tackles = team.teamname #
        break 
      end
    end
    team_with_most_tackles
  end

  def fewest_tackles(season_id)
    game_ids_for_season = []
    
    @games.each do |game|
      if game.season == season_id  
        game_ids_for_season << game.game_id 
      end
    end
  
    tackles_by_team = Hash.new(0)
  
    @game_teams.each do |game_team|
      if game_ids_for_season.include?(game_team.game_id) 
        team_id = game_team.team_id 
        tackles = game_team.tackles.to_i 
        tackles_by_team[team_id] += tackles
      end
    end
  
    fewest_tackles_team = tackles_by_team.min_by do |team_id, tackles|
      tackles  
    end
    
    fewest_tackles_team_id = fewest_tackles_team[0]
  
    team_with_fewest_tackles = nil
    @teams.each do |team|
      if team.team_id == fewest_tackles_team_id #
        team_with_fewest_tackles = team.teamname #
        break 
      end
    end
  
    team_with_fewest_tackles
  end
end

 