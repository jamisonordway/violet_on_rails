require 'rails_helper'

RSpec.describe LyricLine do
  describe 'instance methods' do
    describe 'stability_estimate' do
      before(:each) do
        @line_1 = LyricLine.create(content: 'this is a lyric')
        @line_2 = LyricLine.create(content: 'even')
        @line_3 = LyricLine.create(content: 'odd')
        @line_4 = LyricLine.create(content: 'longer lyric that is even')
        @line_5 = LyricLine.create(content: 'longer lyric that is odd')
      end

      it 'guesses the line stability based on syllable count' do
        expect(@line_1.stability_estimate).to eq('Unbalanced')
        expect(@line_2.stability_estimate).to eq('Balanced')
        expect(@line_3.stability_estimate).to eq('Unbalanced')
        expect(@line_4.stability_estimate).to eq('Balanced')
        expect(@line_5.stability_estimate).to eq('Unbalanced')
      end
    end
  end

  describe 'class methods' do
    describe 'aggregate_stability_estimate' do
      before(:each) do
        @line_1 = LyricLine.create(content: 'this is a lyric', stability: 2)
        @line_2 = LyricLine.create(content: 'even', stability: 1)
        @line_3 = LyricLine.create(content: 'odd', stability: 2)
      end

      it 'guesses the overall stability of a combination of lyric lines' do
        expect(LyricLine.aggregate_stability_estimate).to eq('Unbalanced')
      end
    end
  end
end
