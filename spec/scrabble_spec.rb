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
end
