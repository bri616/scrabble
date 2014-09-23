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
    Word::error_handling(word_string)
    @word_string = word_string.downcase
    @score = score
    @length = word_string.length
  end

  def self.error_handling(word_string)
    raise ArgumentError, "Words can only contain letters." if word_string == "" || word_string[/[^a-zA-Z]+/]
  end

  def self.letter_score(letter)
    LETTERS.each { |key, value| return value if key.include? letter.upcase }
  end

  def score
    @word_string.chars.collect { |letter| Word::letter_score(letter) }.reduce :+
  end
end
