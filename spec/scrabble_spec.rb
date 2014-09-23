require './scrabble'
require './word'

describe Scrabble do

  describe "score" do
    it "returns the point score for the word" do
      expect(Scrabble::score(Word.new("cow"))).to eq 3+1+4
    end
  end

  describe "highest_score_from" do
    it "returns the word with the highest score" do
      array_of_words = [Word.new("cow"),Word.new("zookeeper")]
      expect(Scrabble::highest_score_from(array_of_words).word_string).to eq "zookeeper"
    end

    context "more than one with the same max score" do

      it "can find the shortest word from an array" do
        array_of_words = [Word.new("ccc"),Word.new("fk")]
        expect(Scrabble::shortest_word(array_of_words).word_string).to eq "fk"
      end

      it "returns the one with 7 letters (better than fewest)" do
        array_of_words = [Word.new("ccc"), Word.new("aaaaaaac")]
        expect(Scrabble::highest_score_from(array_of_words).word_string).to eq "aaaaaaac"
      end

      it "returns the one with the fewest letters" do
        array_of_words = [Word.new("ccc"), Word.new("fk")]
        expect(Scrabble::highest_score_from(array_of_words).word_string).to eq "fk"
      end

      it "returns the first word in supplied list if there are ties" do
        array_of_words = [Word.new("aaa"), Word.new("eee")]
        expect(Scrabble::highest_score_from(array_of_words).word_string).to eq "aaa"
      end
    end
  end
end
