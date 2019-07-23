require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def perform
    puts "--------------------------------------------------"
    puts "|| Bienvenue sur Ils Veulent Tous Ma POO ||"
    puts "|| Le but du jeu est d'être le dernier survivant ! ||"
    puts "--------------------------------------------------"

    puts "Saisissez votre prénom : "
    print ">"
    prenom = gets.chomp

    human_player = HumanPlayer.new(prenom)
    player1 = Player.new("Josiane")
    player2 = Player.new("José")
    enemies = [player1, player2]

    while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
        puts ""
        human_player.show_state
        puts ""
        puts "Quelle action veux-tu effectuer ?"
        puts ""
        puts "  a - chercher une meilleure arme"
        puts "  s - chercher à se soigner"
        puts ""
        puts " attaquer un joueur en vue :"
        puts "  0 - #{player1.show_state}"
        puts "  1 - #{player2.show_state}"
        print ">"
        user_input = gets.chomp

        system "clear"  #clear console

        case user_input
        when "a"
            human_player.search_weapon
        when "s"
            human_player.search_health_pack
        when "0"
            human_player.attack(player1)
        when "1"
            human_player.attack(player2)
        else 
            "Saisissez une des lettres du menu"
        end

        enemies.each {|enem| enem.attack(human_player) if enem.life_points > 0} #Chaque énemi attaque l'humain si enemi encore en vie
    end

    puts "La partie est finie"
    puts "Bravo !! Tu as gagné" if human_player.life_points > 0 
    puts "Loser! Tu as perdu contre des robots" if human_player.life_points <= 0

end
perform