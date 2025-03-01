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
        expect(@stat_tracker.games).to be_a(CSV::Table)
        expect(@stat_tracker.teams).to be_a(CSV::Table)
        expect(@stat_tracker.game_teams).to be_a(CSV::Table)
      end

      it 'loads data from CVS files' do
          # binding.pry
        expect(@stat_tracker.games.count).to be > 0
        expect(@stat_tracker.teams.count).to be > 0
        expect(@stat_tracker.game_teams.count).to be > 0
      end
    end
end  
