require './word'

describe Word do

  describe "#error_handling" do
    it "raises an ArgumentError if the word contains a non-alphabetic character" do
      expect { Word.new("12gghy.") }.to raise_error ArgumentError
    end
  end

  describe "letter_score" do
    it "returns the score for a letter" do
      expect(Word::letter_score("A")).to eq 1
    end
  end

  describe "#score" do
    it "returns the score for the current word" do
      expect(Word.new("aaa").score).to eq 3
    end
  end

end
