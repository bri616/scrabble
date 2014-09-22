require './word'

describe Word do

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
