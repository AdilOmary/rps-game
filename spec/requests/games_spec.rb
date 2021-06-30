require 'rails_helper'

RSpec.describe 'Games', type: :request do
  describe 'GET /index' do
    it 'returns the moves' do
      post '/games', params: { move: 'rock', name: 'Player' }
      expect(response).to have_http_status(:created)
    end
  end
end
