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
    let(:player) { Scrabble::Player.new("Bookis") }

    describe "#name" do
      it "returns the player's name" do
        expect(player.name).to eq "Bookis"
      end
    end

    describe "#play" do
      it "adds a word to the player's plays" do
        player.play "foo"
        expect(player.plays).to eq ["foo"]
      end
    end

    describe "#plays" do
      it "returns an array of words" do
        expect(player.plays).to be_an_instance_of Array
        player.play "foo"
        expect(player.plays.first).to be_an_instance_of String
      end
    end

    describe "#total_score" do
      it "returns sum of all words played" do
        player.play "foo"
        player.play "bar"
        expect(player.total_score).to eq 11
      end
    end

    describe "#won?" do
      it "returns true if total score is greater than 100 points" do
        2.times { player.play "bananas" }
        expect(player.won?).to eq true
      end

      it "returns false if total score is less than 100 points" do
        2.times { player.play "foo" }
        expect(player.won?).to eq false
      end
    end

    describe "#highest_scoring_word" do
      it "returns the word with highest score" do
        player.play "foo"
        player.play "bananas"
        player.play "hand"
        expect(player.highest_scoring_word).to eq "bananas"
      end
    end

    describe "#highest_word_score" do
      it "returns the score of highest scoring word" do
        player.play "foo"
        player.play "bananas"
        player.play "hand"
        expect(player.highest_word_score).to eq 59
      end
    end

    describe "#draw_tiles" do
      it "returns a maximum of 7 tiles" do
        tilebag = Scrabble::TileBag.new
        player.draw_tiles(tilebag)
        expect(player.tiles.count).to eq 7
      end

      it "returns the players current tiles" do
        tilebag = Scrabble::TileBag.new
        player.draw_tiles(tilebag)
        expect(player.tiles.all? {|tile| tile.is_a? String } ).to eq true
      end
    end
  end

  describe Scrabble::TileBag do
    let(:tilebag) { Scrabble::TileBag.new }

    describe "#new" do
      it "initializes collection of tiles" do
        expect(tilebag.tiles["A"]).to eq 9
      end
    end

    describe "#draw_tiles" do
      it "returns n number of random tiles" do
        tiles = tilebag.draw_tiles 3
        expect(tiles).to be_an_instance_of Array
        expect(tiles.count).to eq 3
      end

      it "reduces the total number of tiles" do
        tilebag.draw_tiles 3
        expect(tilebag.tiles_remaining).to eq 95
      end
    end

    describe "#tiles_remaining" do
      it "returns the remaining number of tiles" do
        expect(tilebag.tiles_remaining).to eq 98
        tilebag.draw_tiles 4
        expect(tilebag.tiles_remaining).to eq 94
        tilebag.draw_tiles 5
        expect(tilebag.tiles_remaining).to eq 89
      end
    end
  end
end
