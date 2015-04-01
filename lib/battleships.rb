require 'sinatra/base'
require_relative 'board'
require_relative 'cell'
require_relative 'game'
require_relative 'player'
require_relative 'ship'
require_relative 'water'

class Battleships < Sinatra::Base
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

  post '/new_game' do
    @name = params[:name]
    erb :new_game
  end

  get '/hit' do
  end

  post '/player' do
  end

  get '/player' do
  end

  set :views, Proc.new {File.join(root, "..", "views")}

  # start the server if ruby file executed directly
  run! if app_file == $0
end
