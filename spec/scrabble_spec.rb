require './scrabble'

describe Scrabble do

  describe "letter_score" do
    it "returns the letter's score as a Fixnum" do
      expect(Scrabble::letter_score("A")).to eq 1
    end
  end

  describe "score" do
    it "returns the point score for the word" do
      expect(Scrabble::score("cow")).to eq 3+1+4
    end
  end

  describe "shortest_word" do
    it "returns the shortest word from an array" do
      array_of_words = ["ccc","fk"]
      expect(Scrabble::shortest_word(array_of_words)).to eq "fk"
    end
  end

  describe "highest_score_from" do
    it "returns the word with the highest score" do
      array_of_words = ["cow","zookeeper"]
      expect(Scrabble::highest_score_from(array_of_words)).to eq "zookeeper"
    end

    context "more than one with the same high score" do
      it "returns the one with the fewest letters" do
        array_of_words = ["ccc", "fk"]
        expect(Scrabble::highest_score_from(array_of_words)).to eq "fk"
      end

    end
  end
end
