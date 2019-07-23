
require_relative 'player'

class Game
    attr_accessor :human_player, :enemies

    def initialize(human_player_name)
        @human_player = HumanPlayer.new(human_player_name)
        p1 = Player.new("Morbax")
        p2 = Player.new("Fumax")
        p3 = Player.new("Tmax")
				p4 = Player.new("Matrax")
				@enemies = [p1, p2, p3, p4]
    end

    def kill_player(dead_player)
        @enemies.delete(dead_player)
    end

		def is_still_ongoing?
			result = false
      result = true if @human_player.life_points > 0 && @enemies.empty? == false
			return result
		end

    def show_players
        nb_bots_alive = @enemies.count
        @human_player.show_state
        puts "Il ya #{nb_bots_alive} bots encore en vie"
    end

    def welcome_screen
        puts "--------------------------------------------------"
        puts "|| Bienvenue sur Ils Veulent Tous Ma POO ||"
        puts "|| Le but du jeu est d'être le dernier survivant ! ||"
        puts "--------------------------------------------------"
    end

		def menu 
        puts "Quelle action veux-tu effectuer ?"
        puts ""
        puts "  a - chercher une meilleure arme"
        puts "  s - chercher à se soigner"
        puts ""
				@enemies.each do |p|
					puts "#{(p).show_state}   #{@enemies.index(p)} - Attaquer #{(p).name} "
				end
		end
		
		def menu_choice
			choice = gets.chomp
			system("clear")
			case choice
			when "a"
				@human_player.search_weapon
			when "s"
				@human_player.search_health_pack
			when "0"
					@human_player.attack(@enemies[0])
			when "1"
				@human_player.attack(@enemies[1])
			when "2"
				@human_player.attack(@enemies[2])
			when "3"
				@human_player.attack(@enemies[3])
			end


			@enemies.each do |p|
				if p.life_points < 0
					kill_player(p)
				end
			end

		end

		def enemies_attack
			
			@enemies.each do |p|
				if self.is_still_ongoing?
					p.attack(@human_player)
				end
			end
		end

		def end
			puts "La partie est finie"
			puts "Bravo !! Tu as gagné" if human_player.life_points > 0 
			puts "Loser! Tu as perdu contre des robots" if human_player.life_points <= 0
		end
end