class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    index
    if valid_move?(@board, index) && !position_taken?(@board, index)
      move(@board, index, (current_player(@board)))
    else
      turn(@board)
    end
    display_board(@board)
  end

  def play
    turn(@board) until over?(@board)
    if won?(@board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(@board)
      puts "Cat's Game!"
    end
  end

  def input_to_index(user_input)
    (user_input.to_i) - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count {|token| token == 'X' || token == 'O' }
  end

  def current_player
    turn_count(@board).even? ? "X" : "O"
  end


  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(@board, combo[0])
    end
  end

  def full?
    @board.all? do|position|
      if position == "X" || position == "O"
        true
      end
    end
  end

  def draw?
    if full?(@board) && !won?(@board)
      true
    end
  end

  def over?
    if draw?(@board) || full?(@board) || won?(@board)
      true
    end
  end

  def winner
    WIN_COMBINATIONS.detect do |combination|
      if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
        return "X"
      elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
        return "O"
      elsif draw?(@board)
        return "nil"
      end
    end
  end

end
