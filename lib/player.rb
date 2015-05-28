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
  end
end
