module Scrabble
  SCORES = {
    "a"=>1,
    "b"=>3,
    "c"=>3,
    "d"=>2,
    "e"=>1,
    "f"=>4,
    "g"=>2,
    "h"=>4,
    "i"=>1,
    "j"=>8,
    "k"=>5,
    "l"=>1,
    "m"=>3,
    "n"=>1,
    "o"=>1,
    "p"=>1,
    "q"=>10,
    "r"=>1,
    "s"=>1,
    "t"=>1,
    "u"=>1,
    "v"=>4,
    "w"=>4,
    "x"=>8,
    "y"=>4,
    "z"=>10 }

  class Game

    Word = Struct.new(:string, :score, :length)

    def self.score word
      points = word.chars.map do |letter|
        SCORES[letter.downcase]
      end
      score = points.reduce(:+)
      if word.length == 7
        score += 50
      end
      score
    end

    def self.highest_score_from words
      word_list = words.map do |word|
        score = score word
        Word.new(word, score, word.length)
      end
      scores = word_list.map { |word| word.score }
      max = scores.max

      max_words = word_list.select do |word|
        word.score == max
      end
      max_words_lengths = max_words.map { |word| word.length }
      min = max_words_lengths.min

      max_words = word_list.select do |word|
        word.length == min
      end
      max_words[0].string
    end
  end
end
