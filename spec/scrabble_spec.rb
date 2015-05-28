require 'spec_helper'
require_relative '../lib/scrabble.rb'

describe Scrabble do
  describe Scrabble::Game do
    describe '#score' do
      it 'scores a word correctly' do
        expect(Scrabble::Game.score "a").to eq 1
        expect(Scrabble::Game.score "foo").to eq 6
        expect(Scrabble::Game.score "bananas").to eq 59
      end
    end

    describe '#highest_score_from' do
      it 'finds the highest-scoring word' do
        expect(Scrabble::Game.highest_score_from ["a", "foo"]).to eq "foo"
      end

      context "if two words have the same score" do
        it 'picks the one with fewer tiles' do
          expect(Scrabble::Game.highest_score_from ["hands", "way"]).to eq "way"
        end

        context 'if two words have the same score and number of tiles' do
          it 'picks the first one in the list' do
            expect(Scrabble::Game.highest_score_from ["bad", "foo"]).to eq "bad"
          end
        end
      end
    end
  end

  describe Scrabble::Player do
#plays: returns an Array of the words played by the player
#play(word): Adds the input word to the plays Array

#total_score: Sums up and returns the score of the players words
#won?: If the player has over 100 points, returns true, otherwise returns 'false'
#highest_scoring_word: Returns the highest scoring word the user has played.
#highest_word_score: Returns the highest_scoring_word score.
    describe "#name" do
      it "returns the player's name" do
        person = Scrabble::Player.new("Bookis")
        expect(person.name).to eq "Bookis"
      end
    end
  end
end
