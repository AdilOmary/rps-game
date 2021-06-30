class Game < ApplicationRecord
  belongs_to :user

  accepts_nested_attributes_for :user

  enum move: [:rock, :paper, :scissors]

  enum bot_move: [:rock, :paper, :scissors], _prefix: true

  validates :move, inclusion: ['rock', 'paper', 'scissors']
  validates :bot_move, inclusion: ['rock', 'paper', 'scissors']

  def who_wins
    if move == bot_move
      "It's a draw"
    elsif move == "rock" && bot_move == "scissors"
      "#{user.name} wins"
    elsif move == "scissors" && bot_move == "paper"
      "#{user.name} wins"
    elsif move == "paper" && bot_move == "rock"
      "#{user.name} wins"
    else
      "Bot wins !"
    end
  end
end
