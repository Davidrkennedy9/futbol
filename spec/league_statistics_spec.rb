require 'spec_helper'
require './lib/league_statistics'
require './lib/stat_tracker'
require './lib/game'
require './lib/team'
require './lib/game_team'

RSpec.describe LeagueStatistics do
  before(:each) do
    @game_path = './data/games.csv'
    @team_path = './data/teams.csv'
    @game_teams_path = './data/game_teams.csv'
   
    @locations = {
      games: @game_path,
      teams: @team_path,
      game_teams: @game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(@locations)
    # binding.pry
 end

    describe 'League Stats' do
      describe '#count_of_teams' do
          it 'can count the number of teams' do
            expect(@stat_tracker.count_of_teams).to be > 0
          end

          it 'returns the right amount of teams' do
            expect(@stat_tracker.count_of_teams).to eq(32)
          end

          it 'returns an integer' do
            expect(@stat_tracker.count_of_teams).to be_an(Integer)
          end
      end

      describe '#best_offense' do
        it 'retruns a string of the best offensive team'  do
          expect(@stat_tracker.best_offense).to be_an(String)
          expect(@stat_tracker.best_offense).to eq ("Reign FC")
        end
      end

      describe '#worst_offense' do
        it 'retruns a string of the worst offensive team'  do
          expect(@stat_tracker.worst_offense).to be_an(String)
          expect(@stat_tracker.worst_offense).to eq ("Utah Royals FC")
        end
      end

      describe '#highest_scoring_visitor' do
        it 'retruns a string of the highest away team goal average'  do
          expect(@stat_tracker.highest_scoring_visitor).to be_an(String)
          expect(@stat_tracker.highest_scoring_visitor).to eq ("FC Dallas")
        end
      end

      describe '#highest_scoring_home_team' do
        it 'retruns a string of the highest home team goal average'  do
          expect(@stat_tracker.highest_scoring_visitor).to be_an(String)
          expect(@stat_tracker.highest_scoring_home_team).to eq ("Reign FC")
        end
      end

      describe '#lowest_scoring_visitor' do
      it 'retruns a string of the highest away team goal average'  do
        expect(@stat_tracker.highest_scoring_visitor).to be_an(String)
        expect(@stat_tracker.highest_scoring_visitor).to eq ("FC Dallas")
      end
    end
    end
end




  
#   xdescribe '#average_goals_by_season' do
#       it 'returns a hash with seasons as keys and average goals per game as the value' do
#         expect(@stat_tracker.average_goals_by_season).to be_a(Hash)
#         expect(@stat_tracker.average_goals_by_season.keys.all?{|key| key.is_a?(String)}).to be(true)
#         expect(@stat_tracker.average_goals_by_season.values.all?{|value| value.is_a?(Float)}).to be(true)

#         seasons_data = @stat_tracker.games.map do |game| 
#           game[:season]
#         end.uniq
#         expect(@stat_tracker.average_goals_by_season.keys.sort).to eq(seasons_data.sort)

#         @stat_tracker.average_goals_by_season.each do |season, average|
#           expect(average).to be > 0
#         end
#       end

#       it "#average_goals_by_season" do
#         expected = {
#           "20122013"=>4.12,
#           "20162017"=>4.23,
#           "20142015"=>4.14,
#           "20152016"=>4.16,
#           "20132014"=>4.19,
#           "20172018"=>4.44
#          }
#           expect(@stat_tracker.average_goals_by_season).to eq(expected)
#         end
#     end