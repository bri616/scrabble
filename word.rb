class Word
  LETTERS = {
    ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
    ["D", "G"]                                         => 2,
    ["B", "C", "M", "P"]                               => 3,
    ["F", "H", "V", "W", "Y"]                          => 4,
    ["K"]                                              => 5,
    ["J", "X"]                                         => 8,
    ["Q", "Z"]                                         => 10
  }
  attr_accessor :score, :length, :word_string

  def initialize(word_string)
    @word_string = word_string.downcase
    @score = score
    @length = word_string.length
  end

  def self.letter_score(letter)
    word_score = nil
    LETTERS.each do |key, value|
      word_score = value if key.include? letter.upcase
    end
    word_score
  end

  def score
    @word_string.chars.collect { |letter| Word::letter_score(letter) }.reduce :+
  end
end
