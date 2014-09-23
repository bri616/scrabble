class Player
  attr_accessor :name, :plays

  def initialize(name = "Awesome")
    @name = name
    @plays = []
  end

  # def self.new(name)
  #   super(name)
  # end

  def play(word)
    @plays << word
  end

  def total_score
    @plays.collect(&:score).reduce :+
  end

  def highest_scoring_word
    Scrabble::highest_score_from(@plays)
  end

  def highest_word_score
    highest_scoring_word.score
  end

end
