class GamesController < ApplicationController
  def create
    # When this endpoint receive an invalid move, we have an argument error
    # we are handling incorrect moves mannually
    # TODO ; Find a way to refactor this
    if params[:move]
      valid_moves = Game.moves.keys.include?(params[:move])
      if !valid_moves
        return render json: {
          move: "should be : '#{Game.moves.keys.join(', ')}'"
        }, status: :unprocessable_entity
      end
    end

    @game = Game.new(
      user_attributes: { name: params[:name] },
      move: params[:move],
      bot_move: Game.bot_moves.keys.sample
    )

    if @game.save
      render json: {
        moves: [{
                name: @game.user.name,
                move: @game.move,
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

  def index
    @games = Game.order(created_at: :desc).limit(params[:limit]).offset(params[:offset])

    render json: {
      moves: @games.map do |game|
        {
          moves: [{
                    name: game.user.name,
                    move: game.move
                  }, {
                    name: 'Bot',
                    move: game.bot_move
                  }],
          results: game.who_wins,
          created_at: game.created_at
        }
      end,
      total_moves: Game.count
    }
  end
end
