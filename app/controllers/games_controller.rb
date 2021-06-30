class GamesController < ApplicationController

# CRUD Create
  def create
    @user = User.create(name: params[:name])
    @game = Game.create(user: @user, move: params[:move], bot_move: Game.bot_moves.keys.sample)

    if @game.save
      render json: {
        moves: [{
                name: @user.name,
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
