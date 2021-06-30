class GamesController < ApplicationController

# CRUD Create
  def create
    @game = Game.new(
      user_attributes: { name: params[:name] },
      move: params[:move],
      bot_move: Game.bot_moves.keys.sample
    )

    if @game.save
      render json: {
        moves: [{
                name: @game.user.name,
                move: @game.move
              }, {
                name: 'Bot',
                move: @game.bot_move
              }],
        results: @game.who_wins
      }, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end
end
