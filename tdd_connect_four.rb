class ConnectFourBoard
  attr_accessor :cells

  def initialize
    @cells = Array.new(6) { Array.new(7, '')}
  end

  def check_win
    @cells.each do |row|
      row.each_cons(4) do |slice|
        return true if slice.all? { |cell| cell == 'X' } || slice.all? { |cell| cell == 'O' }
      end
    end
    false
  end
end

class Game
  attr_accessor :board, :player1, :player2

  def initialize(player1 = 'Player 1', player2 = 'Player 2')
    @board = ConnectFourBoard.new
    @player1 = player1
    @player2 = player2
  end

  def start 
    until @board.full? || @board.check_win
    end
  end
end