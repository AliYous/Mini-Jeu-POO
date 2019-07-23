require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def perform
    puts "quel est ton nom ? "
    name = gets.chomp
    game = Game.new(name)
    puts ""
    game.welcome_screen
    puts ""


    count = 1
    while game.is_still_ongoing?
        puts "---------------------- Tour #{count} ------------------------"
        puts ""
        game.menu
        print ">"
        game.menu_choice
        game.enemies_attack
        puts ""
        puts game.show_players
        count += 1
    end
    game.end
end
perform
