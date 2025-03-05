<<<<<<< HEAD
require 'csv'

class Game
  attr_reader :game_id, :season, :type, :date_time, :away_team_id, :home_team_id, :away_goals, :home_goals, :venue, :venue_link

  def initialize(game_id, season, type, date_time, away_team_id, home_team_id, away_goals, home_goals, venue, venue_link)
    @game_id = game_id
    @season = season
    @type = type
    @date_time = date_time
    @away_team_id = away_team_id
    @home_team_id = home_team_id
    @away_goals = away_goals
    @home_goals = home_goals
    @venue = venue
    @venue_link = venue_link
  end
=======
require "csv"
class Game
    attr_reader :game_id,
                :season,
                :type,
                :date_time,
                :away_team_id,
                :home_team_id,
                :away_goals,
                :home_goals,
                :venue,
                :venue_link
                
    def initialize(game_data)
        
         @game_id = game_data[:game_id].to_i
         @season = game_data[:season]
         @type = game_data[:type]
         @date_time = game_data[:date_time]
         @away_team_id = game_data[:away_team_id].to_i
         @home_team_id = game_data[:home_team_id].to_i
         @away_goals = game_data[:away_goals].to_i
         @home_goals = game_data[:home_goals].to_i
         @venue = game_data[:venue]
         @venue_link = game_data[:venue_link]
         
    end
>>>>>>> e0cc89a2bc4cf842055a51b023775a2e89e39e31
end