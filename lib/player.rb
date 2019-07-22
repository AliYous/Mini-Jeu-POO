class Player
  attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end

	#Affiche l'état de pdv actuel du player sur lequel la méthode est appliquée
	def show_state
		puts "#{self.name} a #{self.life_points} points de vie"
	end

	def gets_damage(damage_value)
		self.life_points -= damage_value
		puts "Le joueur #{self.name} à été tué :(" if self.life_points <= 0 
	end


end