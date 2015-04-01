require 'sinatra/base'

class Battleships < Sinatra::Base



  GAME = Game.new

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    @name = params[:name]
    erb :login
  end

  get '/new_game' do
    erb :new_game
  end

  post '/start_game' do
    first_name
    player_one = Player.new(params[:first_name])
    player_two = Player.new("Computer")
    player_one_board = Board.new({size: 9, cell: Cell, number_of_pieces: 1})
    player_two_board = Board.new({size:})
  end

  set :views, Proc.new {File.join(root, "..", "views")}

  # start the server if ruby file executed directly
  run! if app_file == $0
end
