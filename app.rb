require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def perform
  player1 = Player.new("Josiane")
	player2 = Player.new("José")

	puts "Passons à la phase d'attaque !"

	while player1.life_points > 0 && player2.life_points > 0 

		puts ""
		puts "Voici l'état de chaque joueur : "
		player1.show_state
		player2.show_state
		puts ""

		player1.attack(player2)
		break if player2.life_points <= 0
		player2.attack(player1)
	end	

end
perform

