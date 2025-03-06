module LeagueStatistics

  def count_of_teams
    teams.count
  end

  #this method finds the team with the best offensive performace bases on the highest average goals per game 
    def best_offense
      #this initalizes a hash using Hash.new with a block 
      #When a new key (team_id) is accessed for the first time it automatically intializes it with a total_goals: 0 and games_played: 0
      #total_goals - the total number of goals scored by the team
      #games_played - total number of games played by the team 
      team_goals = Hash.new do |hash, key| 
        hash[key] = { total_goals: 0, games_played: 0 }
      end
#iterates thorugh @games_temas - a list of team performances
#team_goals is a the hash - we set the key to [game_team.team_id] this is an unique team identifier
# we then increment(add to total_goals) by its team_id by whatever goals are held in the game_team csv
#then its the same thing for games_player we are adding 1 for everytime the team_id runs through indicating they played games
      @game_teams.each do |game_team|
        team_goals[game_team.team_id][:total_goals] += game_team.goals
        team_goals[game_team.team_id][:games_played] += 1
      end
  # we use max_by to find the highest avergae goals per game 
  # we divide the games played by the number of goals for each team to find the average of each team 
  #max_by will order the outputes itntegers wiht there coresponding team_id from highest to lowest
  #to_f is making it a decimal so it haelp avoid division issuses
  #then we put .first to pull ou the first/highest integer with its team_id
  #we are setting it to the best_team_id variable to hold it
      best_team_id = team_goals.max_by do |team_id, stats| 
        stats[:total_goals] / stats[:games_played].to_f
      end.first
 #we are iterating through @team which hold all the team(teamnames)
 #.find will find whatever we put in the code within the block we want 
 #we set == the team_id to the best_team_id so it will find the matching team id in the @teams so we can pull out the team name
 #we then set it to a varibe to hold it = team 
      team = @teams.find do |team| 
        team.team_id == best_team_id 
      end
      #we then take that varibale to access the @team with the highest average - team_id and call .teamname to access its name to print a string of it
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
  
end