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
	end
end

describe Game do
	let(:game) { described_class.new }

	describe '#initialize' do
		context 'when using default initialization' do
			it 'is Player 1' do
				expect(game.player1).to eq('Player 1')
			end
			it 'is Player 2' do
				expect(game.player2).to eq('Player 2')
			end
		end

	end

end