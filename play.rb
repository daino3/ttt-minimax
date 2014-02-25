load File.expand_path('../config/environment.rb',  __FILE__)

game = GameStarter.new.create_game
game.play