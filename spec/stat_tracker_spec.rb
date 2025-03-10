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

    it "#percentage_visitor_wins" do
    expect(@stat_tracker.percentage_visitor_wins).to eq(0.36)
    end

    it "#percentage_ties" do
    expect(@stat_tracker.percentage_ties).to eq(0.20)
    end

    it "#count_of_games_by_season" do
      expected = {
      "20122013"=>806,
      "20162017"=>1317,
      "20142015"=>1319,
      "20152016"=>1321,
      "20132014"=>1323,
      "20172018"=>1355
      }
      expect(@stat_tracker.count_of_games_by_season).to eq(expected)
    end

    it "#average_goals_per_game" do
      expect(@stat_tracker.average_goals_per_game).to eq(4.22)
    end
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
        expect(@stat_tracker.highest_scoring_home_team).to be_an(String)
        expect(@stat_tracker.highest_scoring_home_team).to eq ("Reign FC")
      end
    end

    describe '#lowest_scoring_visitor' do
      it 'retruns a string of the lowest away team goal average'  do
        expect(@stat_tracker.lowest_scoring_visitor).to be_an(String)
        expect(@stat_tracker.lowest_scoring_visitor).to eq ("San Jose Earthquakes")
      end
    end
  end

  describe '#average_goals_by_season' do
    it 'returns a hash with seasons string as keys and average goals per game as the value float' do
      expect(@stat_tracker.average_goals_by_season).to be_a(Hash)
      expect(@stat_tracker.average_goals_by_season.keys.all?{|key| key.is_a?(String)}).to be(true)
      expect(@stat_tracker.average_goals_by_season.values.all?{|value| value.is_a?(Float)}).to be(true)
    end

    it "calculates corresctly" do
      expected = {
          "20122013"=>4.12,
          "20162017"=>4.23,
          "20142015"=>4.14,
          "20152016"=>4.16,
          "20132014"=>4.19,
          "20172018"=>4.44
          }
      expect(@stat_tracker.average_goals_by_season).to eq(expected)
    end
  end

  describe 'Season Statistics' do
    it "#winningest_coach" do
      expect(@stat_tracker.winningest_coach("20132014")).to eq "Claude Julien"
      expect(@stat_tracker.winningest_coach("20142015")).to eq "Alain Vigneault"
    end

    it "#worst_coach" do
      expect(@stat_tracker.worst_coach("20132014")).to eq "Peter Laviolette"
      expect(@stat_tracker.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
    end

    it "#most_accurate_team" do
      expect(@stat_tracker.most_accurate_team("20132014")).to eq "Real Salt Lake"
      expect(@stat_tracker.most_accurate_team("20142015")).to eq "Toronto FC"
    end

    it "#least_accurate_team" do
      expect(@stat_tracker.least_accurate_team("20132014")).to eq "New York City FC"
      expect(@stat_tracker.least_accurate_team("20142015")).to eq "Columbus Crew SC"
    end


    it "#most_tackles" do
      expect(@stat_tracker.most_tackles("20132014")).to eq "FC Cincinnati"
      expect(@stat_tracker.most_tackles("20142015")).to eq "Seattle Sounders FC"
    end
    
    it "#fewest_tackles" do
      expect(@stat_tracker.fewest_tackles("20132014")).to eq "Atlanta United"
      expect(@stat_tracker.fewest_tackles("20142015")).to eq "Orlando City SC"
    end
    
    it "#lowest_scoring_home_team" do
      expect(@stat_tracker.lowest_scoring_home_team).to eq "Utah Royals FC"
    end
  end
end  
