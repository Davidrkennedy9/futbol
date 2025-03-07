module GameStatistics

    def highest_total_score
        score = []
        @games.each do |game|
           score_tracker = game.away_goals + game.home_goals
           score << score_tracker
        end
        score.max 
    end

    def lowest_total_score
        score = []
        @games.each do |game|
            score_tracker = game.away_goals + game.home_goals
            score << score_tracker
        end
        score.min
    end

    def percentage_home_wins
        home_wins = 0
        @games.each do |game|
           if game.home_goals > game.away_goals 
            home_wins += 1
           end
        end
        (home_wins / @games.length.to_f).round(2)
    end

    def percentage_visitor_wins
        away_wins = 0
        @games.each do |game|
           if game.home_goals < game.away_goals 
            away_wins += 1
           end
        end
        (away_wins / @games.length.to_f).round(2)  
         
    end

    def percentage_ties
        tie_games = 0
        @games.each do |game|
            if game.home_goals == game.away_goals
                tie_games += 1
            end
        end
        (tie_games / @games.length.to_f).round(2)
    end

    def count_of_games_by_season
        game_count = {}
        @games.each do |game|
            if game_count[game.season] == nil
                game_count[game.season] = 0
            end
                game_count[game.season] += 1 
        end
        game_count
    end
    def average_goals_per_game
        total_goals = 0
        @games.each do |game|
          total_goals += game.home_goals + game.away_goals 
        end
        (total_goals / @games.count.to_f).round(2)
        
    end
end