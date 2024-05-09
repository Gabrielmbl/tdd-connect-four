require_relative '../tdd_connect_four'

describe ConnectFourBoard do
  
  describe '#check_win' do
    let(:board) { described_class.new }
    context 'when there is a horizontal line win' do
      it 'returns true' do
        board.cells[0][0] = board.cells[0][1] = board.cells[0][2] = board.cells[0][3] = 'X'
        expect(board.check_win).to be true
      end
    end

    context 'when there is not a horizontal line win' do
      it 'returns false' do
        board.cells[0][0] = board.cells[0][1] = 'X'
        board.cells[0][2] = board.cells[0][3] = 'O'
        expect(board.check_win).to be false
      end
    end

    context 'when there is a vertical line win' do
      it 'returns true' do
        board.cells[0][0] = board.cells[1][0] = board.cells[2][0] = board.cells[3][0] = 'X'
        expect(board.check_win).to be true
      end
    end

    context 'when there is not a vertical line win' do
      it 'returns false' do
        board.cells[0][0] = board.cells[1][0] = board.cells[3][0] = 'X'
        board.cells[4][0] = 'O'
        expect(board.check_win).to be false
      end
    end

    context 'when there is a diagonal line win' do
      it 'returns true' do
        board.cells[0][0] = board.cells[1][1] = board.cells[2][2] = board.cells[3][3] = 'X'
        expect(board.check_win).to be true
      end
    end

    context 'when there is a top-left to bottom-right diagonal win' do
      it 'returns true' do
        board.cells[0][0] = board.cells[1][1] = board.cells[2][2] = board.cells[3][3] = 'X'
        expect(board.check_win).to be true
      end
    end

    context 'when there is a diagonal line win' do
      it 'returns true' do
        board.cells[2][3] = board.cells[3][4] = board.cells[4][5] = board.cells[5][6] = 'X'
        expect(board.check_win).to be true
      end
    end

    context 'when there is a bottom-left to top-right diagonal win' do
      it 'returns true' do
        board.cells[5][0] = board.cells[4][1] = board.cells[3][2] = board.cells[2][3] = 'O'
        expect(board.check_win).to be true
      end
    end
  end

  describe '#move' do
    let(:board) { ConnectFourBoard.new }

    context 'when the cell is empty' do
      it 'places the player symbol in the specified location' do
        location_row = 0
        location_column = 3
        player_symbol = 'X'
        expect(board.move(location_row, location_column, player_symbol)).to be true
        expect(board.cells[location_row][location_column]).to eq(player_symbol)
      end
    end

    context 'when the cell is not empty' do
      it 'does not place the player symbol and returns false' do
        location_row = 0
        location_column = 3
        initial_symbol = 'X'
        new_symbol = 'O'
        board.cells[location_row][location_column] = initial_symbol
        expect(board.move(location_row, location_column, new_symbol)).to be false
        expect(board.cells[location_row][location_column]).to eq(initial_symbol)
      end
    end
  end
end

describe Game do
  
  describe '#initialize' do
  let(:game) { described_class.new }
    context 'when using default initialization' do
      it 'is Player 1' do
        expect(game.player1.name).to eq('Player 1')
      end
      it 'is Player 2' do
        expect(game.player2.name).to eq('Player 2')
      end
    end
  end

  
  describe '#switch_players' do
  let(:player1) { Player.new('Player 1', 'X') }
  let(:player2) { Player.new('Player 2', 'O') }
  let(:game) { described_class.new(player1, player2) }
  
    context 'when current player is player 1' do
      it 'switches to player 2' do
        game.switch_players
        expect(game.current_player.name).to eq('Player 2')
      end
    end

    context 'when current player is player 2' do
      it 'switches to player 1' do
        game.switch_players
        game.switch_players
        expect(game.current_player.name.name).to eq('Player 1')
      end
    end
  end
end
