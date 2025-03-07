require 'csv'
require_relative 'game'
require_relative 'team'
require_relative 'game_team'
require_relative 'season_statistics'
class StatTracker
    attr_reader :games, :teams, :game_teams

    include SeasonStatistics

    def initialize(games, teams, game_teams) #initialize runs automatically whenever we create a new StatTracker object.

       @games = games #Storing those objects in instance variables (@games, @teams, @game_teams).
       @teams = teams
       @game_teams = game_teams

    end

    def self.from_csv(locations)

        games = CSV.read(locations[:games], headers: true, header_converters: :symbol).map do |row| #Reading CSV files and converting each row into an object (Game, Team, or GameTeam).
            Game.new(row)   
        end

        teams = CSV.read(locations[:teams], headers: true, header_converters: :symbol).map do |row|
            Team.new(row) 
        end

        game_teams = CSV.read(locations[:game_teams], headers: true, header_converters: :symbol).map do |row|
            
            GameTeam.new(row)
        end
        
        new(games, teams, game_teams) #creates a new StatTracker object. stores the parsed data inside it. StatTracker now contains all games, teams, and game-teams as objects.
        

    end 
end
