require 'board'

describe Board do 
  let(:board) { Board.new }

  describe "#gameover?" do
    context "given #line_match? being 'true'" do
      it "returns the winner" do
        turns = double
        allow(board).to receive(:line_match?).and_return(true)
        expect(board.gameover?).to eql(board.turn)
      end
    end
  end
end