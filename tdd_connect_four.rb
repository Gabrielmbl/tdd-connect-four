class ConnectFourBoard
  attr_accessor :cells

  def initialize
    @cells = Array.new(6) { Array.new(7, 'empty')}
  end

  def display
    puts "  0   1   2   3   4   5   6"
    puts "+---+---+---+---+---+---+---+"
    @cells.each do |row|
      puts "| #{row.map { |cell| cell == 'empty' ? ' ' : cell }.join(' | ')} |"
      puts "+---+---+---+---+---+---+---+"
    end
  end

  def move(location_row, location_column, player_symbol)
    if @cells[location_row][location_column] == 'empty'
      @cells[location_row][location_column] = player_symbol
      true
    else
      false
    end
  end

  def check_win
    # Check rows
    @cells.each do |row|
      row.each_cons(4) do |slice|
        return true if slice.all? { |cell| cell == 'X' } || slice.all? { |cell| cell == 'O' }
      end
    end

    # Check columns
    transposed_board = @cells.transpose
    transposed_board.each do |column|
      column.each_cons(4) do |slice|
        return true if slice.all? { |cell| cell == 'X' } || slice.all? { |cell| cell == 'O' }
      end
    end
    
    # Check diagonals
    (0..2).each do |row|
      (0..3).each do |col|
        return true if (0..3).all? { |i| @cells[row + i][col + i] == 'X' } || (0..3).all? { |i| @cells[row + i][col + i] == 'O' }
      end
    end

    (0..2).each do |row|
      (3..6).each do |col|
        return true if (0..3).all? { |i| @cells[row + i][col - i] == 'X' } || (0..3).all? { |i| @cells[row + i][col - i] == 'O' }
      end
    end
    
    false
  end

  def full?
    cells.all? { |row| row.none? { |cell| cell == 'empty' } }
  end
end

class Player
  attr_accessor :name, :symbol

  def initialize(name, symbol)
    self.name = name
    self.symbol = symbol
  end
end

class Game
  attr_accessor :board, :player1, :player2, :current_player

  def initialize(player1 = 'Player 1', player1_symbol = "X", player2 = 'Player 2', player2_symbol = "O")
    @board = ConnectFourBoard.new
    @player1 = Player.new(player1, player1_symbol)
    @player2 = Player.new(player2, player2_symbol)
    @current_player = @player1
  end

  def switch_players
    self.current_player = current_player == @player1 ? @player2 : @player1
  end

  def start 
    until @board.full? || @board.check_win
      board.display
      puts "#{current_player.name}'s turn:"
      puts 'Enter row (0-5):'
      row = gets&.chomp.to_i
      puts 'Enter column (0-6):'
      column = gets&.chomp.to_i
      if row.between?(0, 5) && column.between?(0, 6)
        if board.move(row, column, current_player.symbol)
          switch_players
        else
          puts 'Invalid move. Try again'
        end
      else
        puts 'Invalid input. Rows and columns need to be between 0 and 2.'
      end
    end

    board.display
    if board.check_win
      switch_players
      puts "Congratulations, #{current_player.name}! You just won the game."
    else
      puts "It's a draw!"
    end
  end
end



# board = ConnectFourBoard.new
# board.display
# game = Game.new
# game.start