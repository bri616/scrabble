class Player
  attr_accessor :name, :plays

  def initialize(name = "Awesome")
    @name = name
    @plays = []
  end

  def play(word)
    won? ? false : @plays << word
  end

  def total_score
    @plays.collect(&:score).inject(0) { |sum, i| sum + i }
  end

  def highest_scoring_word
    Scrabble::highest_score_from(@plays)
  end

  def highest_word_score
    highest_scoring_word.score
  end

  def won?
    total_score > 100
  end

end
