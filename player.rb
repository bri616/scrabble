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
    won? ? false : @plays << word
  end

  def total_score
    if plays.length > 0
      @plays.collect(&:score).reduce :+
    else
      0
    end
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
