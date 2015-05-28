#tiles a collection of letters that the player can play (max 7)
#draw_tiles(tile_bag) fills tiles array until it has 7 letters from the given tile bag

module Scrabble
  class Player
    attr_accessor :name, :plays, :tiles

    def initialize name
      @name = name
      @plays = []
      @tiles = []
    end

    def play word
      @plays << word
    end

    def total_score
      plays.map do |word|
        Scrabble::Game.score word
      end.reduce(:+)
    end

    def won?
      total_score > 100
    end

    def highest_scoring_word
      Scrabble::Game.highest_score_from plays
    end

    def highest_word_score
      word = highest_scoring_word
      Scrabble::Game.score word
    end

    def draw_tiles(tilebag)
      while tiles.count < 7
        tiles <<  tilebag.draw_tiles(1)
      end
      tiles.flatten!
    end
  end
end
