module TicTacToe
  class Game
    attr_reader :players
    attr_accessor :current_turn, :marked_spaces, :board

    WINNING_SPACES = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]
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
          marked_spaces: []
        },
        player_two: {
          name: player_two_name.downcase.capitalize,
          mark: "O",
          marked_spaces: []
        }
      }

      @board = {
          a: [1, 2, 3],
          b: [4, 5, 6],
          c: [7, 8, 9]
      }

      @current_turn = players[:player_one]

      @marked_spaces = Array.new
    end

    def render_board
      puts(
        "
 #{board[:a][0]} | #{board[:a][1]} | #{board[:a][2]} 
---+---+---
 #{board[:b][0]} | #{board[:b][1]} | #{board[:b][2]} 
---+---+--- 
 #{board[:c][0]} | #{board[:c][1]} | #{board[:c][2]} 
        "
      )
    end

    def evaluate_win
      WINNING_SPACES.each do |arr|
        if (arr - current_turn[:marked_spaces]).empty?
          render_board
          puts("\n#{current_turn[:name]} is the winner!")
          puts("GAME OVER")
          return true
        end
      end
      return false
    end

    def place_mark
      begin
        input = 0
        new_mark = false
        while input < 1 || input > 9 || new_mark == false
          print("Enter a number from 1 - 9: ")
          input = gets.chomp
          input = Integer(input)
          if input < 1 || input > 9
            print("Invalid input!\n")            
          end
          if marked_spaces.include? input
            puts("\nThis space is already marked!")
          else
            new_mark = true
            marked_spaces.push(input)
            current_turn[:marked_spaces].push(input)
            board.each do |key, value|
              value.each_with_index do |number ,index|
                if number == input
                  board[key][index] = current_turn[:mark]
                end
              end
            end
          end
        end
      rescue Exception
        print("\nInvalid input!\n")
        retry
      end
    end

    def core_loop
      round_counter = 1
      winner = false
      while winner == false
        if round_counter == 10
          render_board
          puts("\nDRAW")
          return puts("GAME OVER")
        end
        puts("\nRound: #{round_counter}")
        render_board
        puts("#{current_turn[:name]}'s turn")
        place_mark
        winner = evaluate_win
        if current_turn == players[:player_one]
          @current_turn = players[:player_two]
        else
          @current_turn = players[:player_one]
        end
        round_counter += 1
      end
    end

  end
end

include TicTacToe
new_game = Game.new
new_game.core_loop