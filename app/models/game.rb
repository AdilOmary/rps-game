class Game < ApplicationRecord
  belongs_to :user

  enum move: [:rock, :paper, :scissor]

  enum bot_move: [:rock, :paper, :scissor], _prefix: true

  validates :move, presence: true
  validates :bot_move, presence: true

  def who_wins
    if move == bot_move
      "It's a draw"
    elsif move == "Rock" && bot_move == "Scissors"
      "#{user.name} wins"
    elsif move == "Scissors" && bot_move == "Paper"
      "#{user.name} wins"
    elsif move == "Paper" && bot_move == "Rock"
      "#{user.name} wins"
    else
      "Bot wins !"
    end
  end
end
