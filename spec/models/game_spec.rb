require 'rails_helper'

RSpec.describe Game, type: :model do
  it 'returns draw if rock if both players plays rock' do
    game = Game.new(move: 'rock', bot_move: 'rock', user: User.new(name: 'Player'))
    expect(game.who_wins).to eq("It's a draw")
  end

  it 'returns player win he plays rock and the bot plays scissors' do
    game = Game.new(move: 'rock', bot_move: 'scissors', user: User.new(name: 'Player'))
    expect(game.who_wins).to eq("Player wins")
  end
end
