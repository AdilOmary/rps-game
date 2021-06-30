require 'rails_helper'

RSpec.describe 'Games', type: :request do
  describe 'POST /games' do
    it 'returns the moves' do
      post '/games', params: { move: 'rock', name: 'Player' }
      expect(response).to have_http_status(:created)
    end

    it "create a game with player's move and the user" do
      expect {
        post '/games', params: { move: 'rock', name: 'adil'}
      }.to change(Game, :count).by(1)
    end

    it "displays an error if the user's name is blank" do
      post '/games', params: { move: 'rock', name: ''}
      expect(response).to have_http_status(:unprocessable_entity)
      json_response = JSON.parse(response.body)
      expect(json_response['user.name']).to eq(["can't be blank"])
    end

    it 'displays an error if the move is not valid' do
      post '/games', params: { move: 'rockk', name: 'Player'}
      expect(response).to have_http_status(:unprocessable_entity)
      json_response = JSON.parse(response.body)
      expect(json_response['move']).to eq("should be : 'rock, paper, scissors'")
    end
  end

  describe 'GET /games' do
    it 'returns a subset of games based on limit and offset' do
      game_1 = Game.create!(move: 'rock', bot_move: 'rock', user_attributes: { name: 'Player 1'})
      game_2 = Game.create!(move: 'rock', bot_move: 'rock', user_attributes: { name: 'Player 2'})
      game_3 = Game.create!(move: 'rock', bot_move: 'rock', user_attributes: { name: 'Player 3'})

      get '/games', params: { limit: 1 }
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['moves'].size).to eq(1)
    end
  end
end

