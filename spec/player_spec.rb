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

    it "returns false if the player has already won" do
      player.play(Word.new("zzzzzzzzzzz"))
      expect(player.play(Word.new("zzzzz"))).to eq false
    end
  end

  describe "#total_score" do
    wordarray = ["aaa", "ccc", "z"]

    it "returns the player's total score" do
      wordarray.each { |word| player.play(Word.new(word)) }
      expect(player.total_score).to eq 3+9+10
    end
  end

  describe "#highest_scoring_word" do
    wordarray = ["aaa", "ccc", "z"]

    it "returns the player's highest scoring word" do
      wordarray.each { |word| player.play(Word.new(word)) }
      expect(player.highest_scoring_word.word_string).to eq "z"
    end
  end

  describe "#highest_word_score" do
    wordarray = ["aaa", "ccc", "z"]

    it "returns the score of the player's highest scoring word" do
      wordarray.each { |word| player.play(Word.new(word)) }
      expect(player.highest_word_score).to eq 10
    end
  end

  describe "#won?" do
    wordarray_lost = ["aaa", "ccc", "z"]
    wordarray_won = ["zzzzz", "qqqqqq"]

    it "returns true if the player has more than 100 points" do
      wordarray_won.each { |word| player.play(Word.new(word)) }
      expect(player.won?).to eq true
    end

    it "returns false if the player has less than 100 points" do
      wordarray_lost.each { |word| player.play(Word.new(word)) }
      expect(player.won?).to eq false
    end
  end


end
