require "spec_helper"

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

       # binding.pry
        expect(@stat_tracker.games).to be_an(Array)
        expect(@stat_tracker.teams).to be_an(Array)
        expect(@stat_tracker.game_teams).to be_an(Array)

        expect(@stat_tracker.games.first).to be_a(Game)
        expect(@stat_tracker.teams.first).to be_a(Team)
        expect(@stat_tracker.game_teams.first).to be_a(GameTeam)

      end
    end  
    describe "game statistics" do 
      it "#highest_total_score" do
        expect(@stat_tracker.highest_total_score).to eq(11)
      end
      it "#lowest_total_score" do
        expect(@stat_tracker.lowest_total_score).to eq(0)
      end
      it "#percentage_home_wins" do
      expect(@stat_tracker.percentage_home_wins).to eq(0.44)
      end
    end
end  
