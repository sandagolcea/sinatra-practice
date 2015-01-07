require 'sinatra/base'

class Game
  def initialize
    @players=[]
  end

  def add_player(player)
    @players << player
  end

  attr_reader :players

end

class Player
  attr_accessor :name
end

class BattleShips < Sinatra::Base

  game = Game.new

  get '/' do
    puts game.inspect
    erb :index
  end

  post '/' do
    @user = params[:user]
    player = Player.new
    session[:me] = player.object_id
    puts player.inspect
    player.name = @user
    puts player.inspect
    game.add_player(player)
    erb :game
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
