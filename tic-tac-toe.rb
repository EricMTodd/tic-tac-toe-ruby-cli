module TicTacToe
  class Game
    attr_reader :players, :current_turn, :board
    def initialize
      @players = {
        player_one: {
          name: "Player 1",
          mark: "X",
          spaces_marked: []
        },
        player_two: {
          name: "Player 2",
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

    def core_loop
      winner = false
      current_turn = players[:player_one]
      counter = 1
      while counter <= 10
        p counter
        puts("#{current_turn[:name]}'s turn")
        if current_turn == players[:player_one]
          current_turn = players[:player_two]
        else
          current_turn = players[:player_one]
        end
        counter += 1
      end
    end

  end
end

include TicTacToe
new_game = Game.new
# new_game.render_board
new_game.core_loop