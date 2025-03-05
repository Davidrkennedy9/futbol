require 'csv'
require_relative '../lib/game'  # Adjust path as needed

RSpec.describe Game do
  describe '#initialize' do
    let(:file_path) { 'data/games.csv' }  # Use your actual CSV file
    let(:first_row) { CSV.read(file_path, headers: true, header_converters: :symbol).first }
    let(:game) do
      Game.new(
        first_row[:game_id].to_i,
        first_row[:season],
        first_row[:type],
        first_row[:date_time],
        first_row[:away_team_id].to_i,
        first_row[:home_team_id].to_i,
        first_row[:away_goals].to_i,
        first_row[:home_goals].to_i,
        first_row[:venue],
        first_row[:venue_link]
      )
    end

    it 'creates an instance of Game' do
      expect(game).to be_a(Game)
    end

    it 'correctly assigns attributes' do
      expect(game.game_id).to eq(first_row[:game_id].to_i)
      expect(game.season).to eq(first_row[:season])
      expect(game.type).to eq(first_row[:type])
      expect(game.date_time).to eq(first_row[:date_time])
      expect(game.away_team_id).to eq(first_row[:away_team_id].to_i)
      expect(game.home_team_id).to eq(first_row[:home_team_id].to_i)
      expect(game.away_goals).to eq(first_row[:away_goals].to_i)
      expect(game.home_goals).to eq(first_row[:home_goals].to_i)
      expect(game.venue).to eq(first_row[:venue])
      expect(game.venue_link).to eq(first_row[:venue_link])
      binding.pry
    end
  end
end
