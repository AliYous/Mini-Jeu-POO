
#------------------------------------------------------------      CLASS ------------------------------------------------------------


class Player
  attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	#Affiche l'état de pdv actuel du player sur lequel la méthode est appliquée
	def show_state
		puts "#{@name} a #{@life_points} points de vie"
	end

	#Réduit les life_points du personnage sur lequel la methode est appellée
	def gets_damage(damage_value)
		self.life_points -= damage_value
		puts "Le joueur #{self.name} à été tué :(" if self.life_points <= 0 
	end

	def attack(attacked_player)
		puts "\nle joueur #{self.name} attaque le joueur #{attacked_player.name}"
		damage = compute_damage	
		puts "Il lui inflige #{damage} points de dommage.\n"
		attacked_player.gets_damage(damage)


		
	end

	#Génère aléatoirement les dégats causés lors d'une attaque
	def compute_damage
    return rand(1..6)
	end
end



#------------------------------------------------------------      CLASS ------------------------------------------------------------


class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@name = name
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
    rand(1..6) * @weapon_level
	end
	
	def search_weapon
		found_weapon_level= rand(1..6)
		puts "Tu as trouvé une arme de niveau #{found_weapon_level}"

		if @weapon_level >= found_weapon_level #Si l'arme actuelle est mieux que l'arme trouvée, on garde l'arme actuelle
			puts "Cette arme est naze! C'est mieux que tu gardes la tienne"
		elsif @weapon_level < found_weapon_level
			@weapon_level = found_weapon_level
			puts "OhYeaaaah! Cette arme est mieux que ton arme actuelle, tu la gardes"
		end
	end

	
	def search_health_pack
		random_dice = rand(1..6)
		if random_dice == 1
			puts "vous n'avez rien trouvé"
		elsif random_dice >= 2 && random_dice <= 5
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			@life_points += 50
		elsif random_dice == 6
			puts "Wooooow, tu as trouvé un pack de +80 points de vie !"
			if @life_points > 20
				@life_points += (100 - @life_points) 
			else
				@life_points += 80
			end
		end
	end



end