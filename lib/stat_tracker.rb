require 'csv'
require_relative 'game'
require_relative 'team'
require_relative 'game_team'
require_relative "game_statistics"

class StatTracker
    attr_reader :games, :teams, :game_teams
    include GameStatistics

    def initialize(games, teams, game_teams)

       @games = games
       @teams = teams
       @game_teams = game_teams

    end

    def self.from_csv(locations)

        games = CSV.read(locations[:games], headers: true, header_converters: :symbol).map do |row|
            Game.new(row)   
        end

        teams = CSV.read(locations[:teams], headers: true, header_converters: :symbol).map do |row|
            Team.new(row) 
        end

        game_teams = CSV.read(locations[:game_teams], headers: true, header_converters: :symbol).map do |row|
            
            GameTeam.new(row)
        end
        
        new(games, teams, game_teams)

    end 
end
