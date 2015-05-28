module Scrabble
  class Player
    attr_accessor :name, :plays

    def initialize name
      @name = name
      @plays = []
    end

    def play word
      @plays << word
    end

    def total_score
      plays.map do |word|
        Scrabble::Game.score word
      end.reduce(:+)
    end
  end
end
