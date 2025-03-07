
module SeasonStatistics
  def winningest_coach(season_id)
    #need to get all games for the  season in test
    season_games = @games.find_all { |game| game.season == season_id }
  
    #get game ids for that season
    season_game_ids = season_games.map { |game| game.game_id }
  
    #all teams that played in those games
    season_game_teams = @game_teams.find_all { |game_team| season_game_ids.include?(game_team.game_id) }
  
    #need a  hash to track wins and total games for each coach
    coach_stats = Hash.new do |hash, key|
      hash[key] = { wins: 0, total_games: 0 }
    end
  
    #count total games and wins for each coach
    season_game_teams.each do |game_team|
      coach = game_team.head_coach
      coach_stats[coach][:total_games] += 1
      if game_team.result == "WIN"
        coach_stats[coach][:wins] += 1
      end
    end
  
    # find the coach with the highest win percentage
    best_coach = coach_stats.max_by do |coach, stats|
      stats[:wins].to_f / stats[:total_games]
    end
  
    # retun coach's name, or nil if no coach found
    best_coach&.first
  end

  def worst_coach(season_id)
    #need to get all games for the  season in test
    season_games = @games.select { |game| game.season == season_id }
  
     #get game ids for that seasonv
    season_game_ids = season_games.map { |game| game.game_id }
  
    #all teams that played in those games
    season_game_teams = @game_teams.select { |game_team| season_game_ids.include?(game_team.game_id) }
  
    #  a hash to track wins and total games for each coach
    coach_stats = Hash.new { |hash, key| hash[key] = { wins: 0, total_games: 0 } }
  
    # count total games and wins for each coach
    season_game_teams.each do |game_team|
      coach = game_team.head_coach
      coach_stats[coach][:total_games] += 1
      coach_stats[coach][:wins] += 1 if game_team.result == "WIN"
    end
  
    # find the coach with the lowest win percentage
    worst_coach = coach_stats.min_by do |coach, stats|
      stats[:wins].to_f / stats[:total_games]
    end
  
    # return only the coach's name, or nil if no coach is found
    worst_coach&.first
  end
end

