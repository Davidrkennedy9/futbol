
class GameTeam 
    attr_reader :game_id, 
                :team_id ,
                :hoa,
                :result,
                :settled_in, 
                :head_coach,
                :goals,
                :shots, 
                :tackles, 
                :pim,
                :powerplayopportunities, 
                :powerplaygoals,
                :faceoffwinpercentage, 
                :giveaways,
                :takeaways
            
    def initialize(game_team_data)
        
        @game_id = game_team_data[:game_id].to_i
        @team_id = game_team_data[:team_id].to_i
        @hoa = game_team_data[:hoa]
        @result = game_team_data[:result]
        @settled_in = game_team_data[:settled_in]
        @head_coach = game_team_data[:head_coach]
        @goals = game_team_data[:goals].to_i
        @shots = game_team_data[:shots].to_i
        @tackles = game_team_data[:tackles].to_i
        @pim = game_team_data[:pim].to_i
        @powerplayopportunities = game_team_data[:powerplayopportunities].to_i
        @powerplaygoals = game_team_data[:powerplaygoals].to_i
        @faceoffwinpercentage = game_team_data[:faceoffwinpercentage].to_f
        @giveaways = game_team_data[:giveaways].to_i
        @takeaways = game_team_data[:takeaways].to_i
        
    end
end