require 'spec_helper'
require_relative '../lib/scrabble.rb'

describe Scrabble::Game do

  describe '#score' do
    it 'scores a word correctly' do
      expect(Scrabble::Game.score "a").to eq 1
      expect(Scrabble::Game.score "foo").to eq 6
    end
  end

end
