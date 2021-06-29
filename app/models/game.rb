class Game < ApplicationRecord
  belongs_to :user

  enum move: {
    rock: :rock,
    paper: :paper,
    scissor: :scissor
  }

  enum bot_move: {
    rock: :rock,
    paper: :paper,
    scissor: :scissor
  }, _prefix: true

  validates :move, presence: true
  validates :bot_move, presence: true
end
