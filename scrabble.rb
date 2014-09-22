class Scrabble
LETTERS = {
  ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
  ["D", "G"]                                         => 2,
  ["B", "C", "M", "P"]                               => 3,
  ["F", "H", "V", "W", "Y"]                          => 4,
  ["K"]                                              => 5,
  ["J", "X"]                                         => 8,
  ["Q", "Z"]                                         => 10
}

  def self.letter_score(letter)
    score = nil
    LETTERS.each do |key, value|
      score = value if key.include? letter.upcase
    end
    score
  end

  def self.score(word)
    word.chars.collect { |letter| letter_score(letter) }.reduce :+
  end

  def self.shortest_word(array_of_words)
    array_of_words.min_by(&:length)
  end

  def self.max_score(array_of_words)
    array_of_words.collect { |word| score(word) }.sort.reverse[0]
  end

  def self.highest_score_from(array_of_words)
    if array_of_words.find_all { |word| word if score(word) == max_score(array_of_words)}.count > 1
      shortest_word(array_of_words)
    else
      array_of_words.max_by { |word| score(word) }
    end
  end
end
