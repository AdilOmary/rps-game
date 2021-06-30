require 'rails_helper'

RSpec.describe 'Games', type: :request do
  describe 'GET /index' do
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
  end
end
