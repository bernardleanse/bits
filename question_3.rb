# Write a game where the player swims down a river infested with
# crocodiles.  The game should:
# * Use the `river` variable that defines the river (see code below).
#   * `-`: clear water.
#   * `C`: crocodile.
#   * The first five characters represent the first part of the river.
#     The second five characters represent the second part of the
#     river.  And so on.
# * Define the player as one character wide.
# * Start the player at the central position of the first part of the
#   river.
#   * e.g. `C-P--`.
# * Each turn:
#   * Check to see if the player is in the same position as a
#     crocodile.  If they are, `puts` `You were eaten.' and stop the
#     program.
#   * `puts` the whole river.  Include a `P` where the player is.
#   * Ask the player if they want to go to left, right or neither.
#     The player enters `left`, `right` or `neither`.
#   * Make the player float down the river by one river part (one line
#     of digits).  Move them to the left, the right, or keep them
#     where they are.
# Print `You survived!` if the player makes it past all parts of the
# river without hitting a crocodile.
#
# * Note: To stop the game when the user is eaten or survives the
#   whole river, don't use `exit` to quit the program because this
#   will break the automated tests.  To exit a while loop early, use
#   the `break` keyword.
#
# * Note: You can assume the player will never move outside the
#   boundary of the river when they choose left and right.  You can
#   also assume the player will always enter either `left`, `right` or
#   `neither`.
#
# * Example output:
#   ```
#   --P--
#   --C--
#   CC-CC
#   CC-CC
#   Type left, right or neither
#   left
#   -----
#   -PC--
#   CC-CC
#   CC-CC
#   Type left, right or neither
#   right
#   -----
#   --C--
#   CCPCC
#   CC-CC
#   Type left, right or neither
#   neither
#   -----
#   --C--
#   CC-CC
#   CCPCC
#   Type left, right or neither
#   neither
#   You survived!
#   ```

def play_game
  river = "-----,--C--,CC-CC,CC-CC"
  river_original = river.split(',')

  river = river.split(',')

  river[0][2] = 'P' 

  current_stage = 0

  while true
    if current_stage == 4
      puts "You survived!"
      break
    end

    puts river

    position = river[current_stage].index('P')

    if river_original[current_stage][position] == "C"
      puts "You were eaten" 
      break
    end

    puts "Type left, right or neither"
    user_input = gets.chomp

    case user_input
    when "left" 
      unless river[current_stage + 1] == nil  
        river[current_stage + 1][position - 1] = 'P'
        river[current_stage] = river_original[current_stage]
      end
  
    when "right"
      unless river[current_stage + 1] == nil
        river[current_stage + 1][position + 1] = 'P'
        river[current_stage] = river_original[current_stage]
      end
    
    when "neither"
      unless river[current_stage + 1] == nil
        river[current_stage + 1][position] = 'P'
        river[current_stage] = river_original[current_stage] 
      end
    end
    current_stage += 1
  end  
end 

play_game()

# def create_river(river)
#   river = river.split(",")
#   river.map! { |part_of_river| part_of_river.chars }
# end

# def get_input()
#   puts "Type left, right or neither"
#   gets.chomp
# end

# def show_river(river)
#   river_return = river.map do |part_of_river|
#     part_of_river.map! do |section|
#       section = 'P' if section.include? 'P'
#       section
#     end
#     part_of_river.join("") 
#   end
#   puts river_return
# end

# def place_player_in_middle(river)
#   river[0][2] += 'P'
#   river
# end

# def find_current_row(river)
#   current_row = 0
#   river.each.with_index { |row, i | current_row = i if row.join.include? 'P' } 
#   return current_row
# end

# def find_current_position(row)
#   row.index { |pos| pos.include? "P"}
# end

# def move_down(input, river)
#   current_row = find_current_row(river)
#   currnet_pos = find_current_position(river[current_row])
  
#   case input
#   when 'left'
#     puts river[current_row][currnet_pos]
#     river[current_row + 1][currnet_pos - 1] += "P"

#   end
#   return river
# end

# def check_for_croc(river)

# end

# def play_game(river)
#   playing = true
#   dynamic_river = create_river(river)
#   dynamic_river = place_player_in_middle(dynamic_river)
#   print dynamic_river
#   while playing
#     show_river(dynamic_river)
#     input = get_input()
#     dynamic_river = move_down(input, dynamic_river)
#     show_river(dynamic_river)
#   end
# end

# play_game(river)
# riv = create_river(river)
# riv[3][1] += 'P'
# show_river(riv)
# print riv[3]
# puts
# puts find_current_position(riv[3])