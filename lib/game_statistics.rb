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
end