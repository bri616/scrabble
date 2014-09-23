require './player'
require './scrabble'
require './word'

describe Player do
  let(:player) { Player.new("Bri") }
  describe "self.new" do
    it "makes a new player with a name" do
      expect(player.class).to eq Player
    end

    describe "#name" do
      it "returns the name of the current Player instance" do
        expect(player.name).to eq "Bri"
      end
    end
  end

  describe "#play" do
    let(:word) { Word.new("cats") }
    it "adds a word to the Player's word list" do
      player.play(word)
      expect(player.plays.pop.word_string).to eq word.word_string
    end
  end

  describe "#total_score" do
    it "does something" do
      wordarray = ["aaa", "ccc", "z"]
      wordarray.each { |word| player.play(Word.new(word)) }
      expect(player.total_score).to eq 3+9+10
    end
  end
end
