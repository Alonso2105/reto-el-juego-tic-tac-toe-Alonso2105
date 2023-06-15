class TicTacToe
  def initialize
    @board = Array.new(9, " ")
    @current_player = "X"
  end

  def print_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def switch_player
    @current_player = (@current_player == "X") ? "O" : "X"
  end

  def make_move(position)
    if position >= 1 && position <= 9 && @board[position - 1] == " "
      @board[position - 1] = @current_player
      return true
    else
      return false
    end
  end

  def winner?
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
      [0, 4, 8], [2, 4, 6] # diagonals
    ]

    winning_combinations.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
        return @current_player
      end
    end

    return false
  end

  def play
    puts "¡Bienvenido al juego del Tic Tac Toe!"
    puts "Para hacer un movimiento, ingresa el número correspondiente a la posición en el tablero:"
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts ""

    loop do
      print_board

      puts "Es el turno del jugador #{@current_player}"
      puts "Ingresa la posición:"

      position = gets.chomp.to_i

      if make_move(position)
        if winner?
          print_board
          puts "¡Felicidades! El jugador #{@current_player} ha ganado."
          break
        elsif @board.all? { |cell| cell != " " }
          print_board
          puts "¡Empate! El juego ha terminado sin ganador."
          break
        else
          switch_player
        end
      else
        puts "Movimiento inválido. Inténtalo de nuevo."
      end
    end
  end
end

game = TicTacToe.new
game.play