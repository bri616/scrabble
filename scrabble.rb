class Scrabble

  def self.score(word)
    word.score
  end

  def self.shortest_word(array_of_words)
    array_of_words.min_by(&:length)
  end

  def self.max_score(array_of_words)
    array_of_words.max_by(&:score).score
  end

  def self.max_score_words(array_of_words)
    array_of_words.find_all { |word| word.score == max_score(array_of_words) }
  end

  def self.seven_letters(array_of_words)
    array_of_words.find { |word| word.length >= 7 }
  end

  def self.highest_score_from(array_of_words)
    if max_score_words(array_of_words).count > 1
      seven_letters(array_of_words) || shortest_word(array_of_words)
    else
      array_of_words.max_by(&:score)
    end
  end
end
