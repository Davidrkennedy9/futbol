require 'rspec'
require_relative '../lib/stat_tracker'
require_relative '../lib/season_statistics'


RSpec.describe SeasonStatistics do
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
  end
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
