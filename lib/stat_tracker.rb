require 'csv'
class StatTracker
  attr_reader :games, :teams, :game_teams

  def initialize(games, teams, game_teams)
    @games = games
    @teams = teams
    @game_teams = game_teams
  end

  def self.from_csv(locations)
    games = CSV.read(locations[:games], headers: true, header_converters: :symbol).map do |row|
      Game.new(
        row[:game_id].to_i,
        row[:season],
        row[:type],
        row[:date_time],
        row[:away_team_id].to_i,
        row[:home_team_id].to_i,
        row[:away_goals].to_i,
        row[:home_goals].to_i,
        row[:venue],
        row[:venue_link]
      )
    end
    teams = CSV.read(locations[:teams], headers: true, header_converters: :symbol).map do |row|
      {
        team_id: row[:team_id].to_i,
        franchiseid: row[:franchiseid].to_i,
        teamname: row[:teamname],
        abbreviation: row[:abbreviation],
        stadium: row[:stadium],
        link: row[:link]
      }
    end
    game_teams = CSV.read(locations[:game_teams], headers: true, header_converters: :symbol).map do |row|
      {
        game_id: row[:game_id].to_i,
        team_id: row[:team_id].to_i,
        hoa: row[:hoa],
        result: row[:result],
        settled_in: row[:settled_in],
        head_coach: row[:head_coach],
        goals: row[:goals].to_i,
        shots: row[:shots].to_i,
        tackles: row[:tackles].to_i,
        pim: row[:pim].to_i,
        powerplayopportunities: row[:powerplayopportunities].to_i,
        powerplaygoals: row[:powerplaygoals].to_i,
        faceoffwinpercentage: row[:faceoffwinpercentage].to_f,
        giveaways: row[:giveaways].to_i,
        takeaways: row[:takeaways].to_i
      }
    end
        
    new(games, teams, game_teams)
  end

#   def average_goals_by_season
#     # binding.pry
#     games_by_season = @games.group_by do |game| 
#       game[:season]
#     end

#     season_stats = games_by_season.transform_values do |games|
#       total_goals = games.sum do |game|
#         (game[:home_goals] || 0) + (game[:away_goals] || 0)
#       end
#         num_games = games.count
#         average_goals = (total_goals/num_games.to_f).round(2)
#     end
#   end

#     def count_of_teams
#       @teams.count
#     end

#     def best_offense
#       team_goals = @game_teams.group_by do |game| 
#         game[:team_id]
#       end

#       team_average_goals = team_goals.transform_values do |games|
#         total_goals = games.sum do |game|
#           (game[:goals] || 0)
#         end
#         (total_goals.to_f/games.count).round(2)
#       end
#       best_team_id = team_average_goals.max_by do |team_id, average_goals|
#         average_goals
#       end.first

#       best_team = @teams.find do |team|
#         team[:team_id] == best_team_id
#       end
#       best_team[:teamname] if best_team
#     end
  end

