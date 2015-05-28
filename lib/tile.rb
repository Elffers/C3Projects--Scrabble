# Create a TileBag class with a minimum of 5 specs. It should have the following class and instance methods:

# self.new creates an instance with a collection of default tiles
#draw_tiles(n) returns n number of random tiles, removes the tiles from the default set.
#tiles_remaining returns the number of tiles remaining in the bag
# Create specs for (minimum 2) and add to the Player class the following instance methods:

#tiles a collection of letters that the player can play (max 7)
#draw_tiles(tile_bag) fills tiles array until it has 7 letters from the given tile bag

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
  end
end
