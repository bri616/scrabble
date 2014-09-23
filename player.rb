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


end
