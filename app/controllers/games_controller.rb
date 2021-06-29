class GamesController < ApplicationController

# CRUD Create
  def create
    render json: {
      name: params[:name],
      move: params[:move],

      "hello": "world"
    }
  end
end
