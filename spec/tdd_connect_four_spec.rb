require_relative '../tdd_connect_four'

describe ConnectFourBoard do
	describe '#check_win' do
		let(:board) { described_class.new }
		context 'when there is a horizontal line win' do
			it 'returns true' do
				expect(board.check_win).to be true
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

	describe '#check_win' do
		context 'when there is a horizontal line win' do
			it 'returns true' do
				expect(game.board).to receive(:check_win).and_return(true)
				expect(game).to receive(:puts).with(/Congratulations, Player \d+! You just won the game./)
				game.start
			end
		end
	end
end