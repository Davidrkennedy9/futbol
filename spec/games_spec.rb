require "spec_helper"

RSpec.describe Game do
  before :each do
    @game = Game.new({ game_id: "2012030221", season: "20122013", type: "Postseason", date_time: "5/16/13", away_team_id: "3", home_team_id: "6", away_goals: "2", home_goals: "3", venue: "Toyota Stadium", venue_link: "/api/v1/venues/null" })
  end

  describe "initialize" do
    it "exist" do
      expect(@game).to be_a(Game)
    end
  end

  describe "attributes" do
    it "has attributes" do
      expect(@game.game_id).to eq(2012030221)
      expect(@game.season).to eq("20122013")
      expect(@game.type).to eq("Postseason")
      expect(@game.date_time).to eq("5/16/13")
      expect(@game.away_team_id).to eq(3)
      expect(@game.home_team_id).to eq(6)
      expect(@game.away_goals).to eq(2)
      expect(@game.home_goals).to eq(3)
      expect(@game.venue).to eq("Toyota Stadium")
      expect(@game.venue_link).to eq("/api/v1/venues/null")
    end        
  end
end