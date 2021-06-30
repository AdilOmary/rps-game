require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'returns false if rock is the object and rock is the argument' do
    game = Game.new(move: 'rock', bot_move: 'rock', user: User.new(name: 'Player'))
    expect(game.who_wins).to eq("It's a dra")
  end
end
