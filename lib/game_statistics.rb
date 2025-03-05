module GameStatistics

    def highest_total_score

        score = []
        @games.each do |game|
           score_tracker = game[:away_goals] + game[:home_goals]
           score << score_tracker
        end

        score.max 
        
    end

end