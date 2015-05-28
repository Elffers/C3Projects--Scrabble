module Scrabble
  class TileBag
    attr_reader :tiles

    def initialize
      @tiles = {
        "A" => 9,
        "B" => 2,
        "C" => 2,
        "D" => 4,
        "E" => 12,
        "F" => 2,
        "G" => 3,
        "H" => 2,
        "I" => 9,
        "J" => 1,
        "K" => 1,
        "L" => 4,
        "M" => 2,
        "N" => 6,
        "O" => 8,
        "P" => 2,
        "Q" => 1,
        "R" => 6,
        "S" => 4,
        "T" => 6,
        "U" => 4,
        "V" => 2,
        "W" => 2,
        "X" => 1,
        "Y" => 2,
        "Z" => 1
      }
    end

    def draw_tiles n
      letters = tiles.keys
      draw = letters.sample(n)
      draw.each do |letter|
        draw_letter letter
      end
      draw
    end

    def draw_letter letter
      if tiles[letter]
        tiles[letter] -= 1
        if tiles[letter] == 0
          tiles.delete letter
        end
      else
        puts "That letter is not available"
      end
    end

    def tiles_remaining
      tiles.values.reduce(:+)
    end
  end
end
