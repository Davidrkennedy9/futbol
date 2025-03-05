require 'spec_helper'

RSpec.describe StatTracker do
  before :each do
     @game_path = './data/games.csv'
     @team_path = './data/teams.csv'
     @game_teams_path = './data/game_teams.csv'
    
     @locations = {
       games: @game_path,
       teams: @team_path,
       game_teams: @game_teams_path
     }

     @stat_tracker = StatTracker.from_csv(@locations)
  end
    describe "initialize" do
      it "exist" do
        @stat_tracker = StatTracker.from_csv(@locations)

        expect(@stat_tracker).to be_a(StatTracker)
      end
    end
    describe "from_csv" do
      it " returns an array of hashes" do
      #  binding.pry
        expect(@stat_tracker.games).to be_an(Array)
        expect(@stat_tracker.teams).to be_an(Array)
        expect(@stat_tracker.game_teams).to be_an(Array)

        expect(@stat_tracker.games.first).to be_a(Hash)
        expect(@stat_tracker.teams.first).to be_a(Hash)
        expect(@stat_tracker.game_teams.first).to be_a(Hash)
      end

      it 'loads data from CVS files' do
          # binding.pry
        expect(@stat_tracker.games.count).to be > 0
        expect(@stat_tracker.teams.count).to be > 0
        expect(@stat_tracker.game_teams.count).to be > 0

       
        expect(@stat_tracker.games.first).to have_key(:game_id)
        expect(@stat_tracker.games.first).to have_key(:season)
        expect(@stat_tracker.games.first).to have_key(:type)
        expect(@stat_tracker.games.first).to have_key(:date_time)
        expect(@stat_tracker.games.first).to have_key(:away_team_id)
        expect(@stat_tracker.games.first).to have_key(:home_team_id)
        expect(@stat_tracker.games.first).to have_key(:away_goals)
        expect(@stat_tracker.games.first).to have_key(:home_goals)
        expect(@stat_tracker.games.first).to have_key(:venue)
        expect(@stat_tracker.games.first).to have_key(:venue_link)
        expect(@stat_tracker.games.first[:game_id]).not_to be_nil

        expect(@stat_tracker.games.first[:game_id]).to eq(2012030221)
        expect(@stat_tracker.games.first[:season]).to eq("20122013")
        expect(@stat_tracker.games.first[:type]).to eq("Postseason")
        expect(@stat_tracker.games.first[:date_time]).to eq("5/16/13")
        expect(@stat_tracker.games.first[:away_team_id]).to eq(3)
        expect(@stat_tracker.games.first[:home_team_id]).to eq(6)
        expect(@stat_tracker.games.first[:away_goals]).to eq(2)
        expect(@stat_tracker.games.first[:home_goals]).to eq(3)
        expect(@stat_tracker.games.first[:venue]).to eq("Toyota Stadium")
        expect(@stat_tracker.games.first[:venue_link]).to eq("/api/v1/venues/null")

        expect(@stat_tracker.teams.first).to have_key(:team_id)
        expect(@stat_tracker.teams.first).to have_key(:franchiseid)
        expect(@stat_tracker.teams.first).to have_key(:teamname)
        expect(@stat_tracker.teams.first).to have_key(:abbreviation)
        expect(@stat_tracker.teams.first).to have_key(:stadium)
        expect(@stat_tracker.teams.first).to have_key(:link)
        expect(@stat_tracker.teams.first[:team_id]).not_to be_nil

        expect(@stat_tracker.teams.first[:team_id]).to eq(1)
        expect(@stat_tracker.teams.first[:franchiseid]).to eq(23)
        expect(@stat_tracker.teams.first[:teamname]).to eq("Atlanta United")
        expect(@stat_tracker.teams.first[:abbreviation]).to eq("ATL")
        expect(@stat_tracker.teams.first[:stadium]).to eq("Mercedes-Benz Stadium")
        expect(@stat_tracker.teams.first[:link]).to eq("/api/v1/teams/1")

        expect(@stat_tracker.game_teams.first).to have_key(:game_id)
        expect(@stat_tracker.game_teams.first).to have_key(:team_id)
        expect(@stat_tracker.game_teams.first).to have_key(:hoa)
        expect(@stat_tracker.game_teams.first).to have_key(:result)
        expect(@stat_tracker.game_teams.first).to have_key(:settled_in)
        expect(@stat_tracker.game_teams.first).to have_key(:head_coach)
        expect(@stat_tracker.game_teams.first).to have_key(:goals)
        expect(@stat_tracker.game_teams.first).to have_key(:shots)
        expect(@stat_tracker.game_teams.first).to have_key(:tackles)
        expect(@stat_tracker.game_teams.first).to have_key(:pim)
        expect(@stat_tracker.game_teams.first).to have_key(:powerplayopportunities)
        expect(@stat_tracker.game_teams.first).to have_key(:powerplaygoals)
        expect(@stat_tracker.game_teams.first).to have_key(:faceoffwinpercentage)
        expect(@stat_tracker.game_teams.first).to have_key(:giveaways)
        expect(@stat_tracker.game_teams.first).to have_key(:takeaways)
        expect(@stat_tracker.game_teams.first[:hoa]).not_to be_nil


        expect(@stat_tracker.game_teams.first[:game_id]).to eq(2012030221)
        expect(@stat_tracker.game_teams.first[:team_id]).to eq(3)
        expect(@stat_tracker.game_teams.first[:hoa]).to eq("away")
        expect(@stat_tracker.game_teams.first[:result]).to eq("LOSS")
        expect(@stat_tracker.game_teams.first[:settled_in]).to eq("OT")
        expect(@stat_tracker.game_teams.first[:head_coach]).to eq("John Tortorella")
        expect(@stat_tracker.game_teams.first[:goals]).to eq(2)
        expect(@stat_tracker.game_teams.first[:shots]).to eq(8)
        expect(@stat_tracker.game_teams.first[:tackles]).to eq(44)
        expect(@stat_tracker.game_teams.first[:pim]).to eq(8)
        expect(@stat_tracker.game_teams.first[:powerplayopportunities]).to eq(3)
        expect(@stat_tracker.game_teams.first[:powerplaygoals]).to eq(0)
        expect(@stat_tracker.game_teams.first[:faceoffwinpercentage]).to eq(44.8)
        expect(@stat_tracker.game_teams.first[:giveaways]).to eq(17)
        expect(@stat_tracker.game_teams.first[:takeaways]).to eq(7)
      end
    end
    # describe '#average_goals_by_season' do
    #   it 'returns a hash with seasons as keys and average goals per game as the value' do
    #     expect(@stat_tracker.average_goals_by_season).to be_a(Hash)
    #     expect(@stat_tracker.average_goals_by_season.keys.all?{|key| key.is_a?(String)}).to be(true)
    #     expect(@stat_tracker.average_goals_by_season.values.all?{|value| value.is_a?(Float)}).to be(true)

    #     seasons_data = @stat_tracker.games.map do |game| 
    #       game[:season]
    #     end.uniq
    #     expect(@stat_tracker.average_goals_by_season.keys.sort).to eq(seasons_data.sort)

    #     @stat_tracker.average_goals_by_season.each do |season, average|
    #       expect(average).to be > 0
    #     end
    #   end

    #   it "#average_goals_by_season" do
    #     expected = {
    #       "20122013"=>4.12,
    #       "20162017"=>4.23,
    #       "20142015"=>4.14,
    #       "20152016"=>4.16,
    #       "20132014"=>4.19,
    #       "20172018"=>4.44
    #      }
    #       expect(@stat_tracker.average_goals_by_season).to eq(expected)
    #     end
    # end

    # describe 'League Stats' do
    #   describe '#count_of_teams' do
    #       it 'can count the number of teams' do
    #         expect(@stat_tracker.count_of_teams).to be > 0
    #       end

    #       it 'returns the right amount of teams' do
    #         expect(@stat_tracker.count_of_teams).to eq(32)
    #       end

    #       it 'returns an integer' do
    #         expect(@stat_tracker.count_of_teams).to be_an(Integer)
    #       end
    #   end

    #   describe '#best_offense' do
    #     it 'retruns a string of the best offensive team'  do
    #       expect(@stat_tracker.best_offense).to be_an(String)
    #       expect(@stat_tracker.best_offense).to eq ("Reign FC")
    #     end
    #   end
    # end
end  
