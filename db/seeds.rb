puts 'Creation of Players'
player_one = Player.create name: "Juan Roman Riquelme", color: "blue"
player_two = Player.create name: "Rodrigo Bueno", color: "red"

puts 'Creation of Game'
Game.create name: 'Connect Four', player_one_id: player_one.id, player_two_id: player_two.id

puts 'Done...'