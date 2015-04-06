require 'sinatra/base'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

class Battleships < Sinatra::Base

  GAME = Game.new


  get '/' do
    30.times{puts "------"}
    erb :login

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
    player_two_board = Board.new({size: 9, cell: Cell, number_of_pieces: 1})
    player_one.board = player_one_board
    player_two.board = player_two_board
    GAME.add_player player_one
    GAME.add_player player_two
    player_one_board.fill_all_content Water.new
    player_two_board.fill_all_content Water.new
    @player = player_one
    erb :place_ship
  end

  set :views, Proc.new {File.join(root, "..", "views")}

  # start the server if ruby file executed directly
  run! if app_file == $0
end
