module TicTacToe
  class Game
    attr_reader :players, :current_turn, :board
    def initialize
      print("Player 1 name: ")
      player_one_name = gets.chomp
      if player_one_name == ""
        player_one_name = "Player 1"
      end
      print("Player 2 name: ")
      player_two_name = gets.chomp
      if player_two_name == ""
        player_two_name = "Player 2"
      end
      @players = {
        player_one: {
          name: player_one_name.downcase.capitalize,
          mark: "X",
          spaces_marked: []
        },
        player_two: {
          name: player_two_name.downcase.capitalize,
          mark: "O",
          spaces_marked: []
        }
      }

      @board = {
        rows: {
          a: [1, 2, 3],
          b: [4, 5, 6],
          c: [7, 8, 9]
        },
        columns: {
          d: [1, 4, 7],
          e: [2, 5, 8],
          f: [3, 6, 9]
        },
        diagonals: {
          g: [1, 5, 9],
          h: [3, 5, 7]
        }
      }
    end

    def render_board
      row = board[:rows]
      puts(
        "
 #{row[:a][0]} | #{row[:a][1]} | #{row[:a][2]} 
---+---+---
 #{row[:b][0]} | #{row[:b][1]} | #{row[:b][2]} 
---+---+--- 
 #{row[:c][0]} | #{row[:c][1]} | #{row[:c][2]} 
        "
      )
    end

    def place_marker
      begin
        input = 0
        while input < 1 || input > 9
          print("Enter a number from 1 - 9: ")
          input = gets.chomp
          input = Integer(input)
          if input < 1 || input > 9
            print("Invalid input!\n")            
          end
        end
      rescue Exception
        print("\nInvalid input!\n")
        retry
      end
    end

    def core_loop
      current_turn = players[:player_one]
      round_counter = 1
      while round_counter < 10
        puts("\nRound: #{round_counter}")
        render_board
        puts("#{current_turn[:name]}'s turn")
        if current_turn == players[:player_one]
          current_turn = players[:player_two]
        else
          current_turn = players[:player_one]
        end
        place_marker  
        round_counter += 1
      end
    end

  end
end

include TicTacToe
new_game = Game.new
new_game.core_loop