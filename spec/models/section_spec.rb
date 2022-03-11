require 'rails_helper'

RSpec.describe Section do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_one(:chord_progression) }
  end

  describe 'class methods' do
    before(:each) do
      @user_1 = User.create!(email: 'example@example.com', password: 'StrongPassword123')
      @user_2 = User.create!(email: 'example2@example.com', password: 'StrongPassword123')
      @section = @user_1.sections.create!(label: 0, section_type: 'intro', lyrics: 'some lyrics', stability: 0)
    end
  end

  describe 'instance methods' do
    before(:each) do
      @user_1 = User.create!(email: 'example@example.com', password: 'StrongPassword123')
      @user_2 = User.create!(email: 'example2@example.com', password: 'StrongPassword123')
      @section = @user_1.sections.create!(label: 0, section_type: 'intro', lyrics: 'some lyrics', stability: 0)
    end

    describe 'chords' do
      it 'returns chords for a section if any exist' do
        ChordProgression.create!(section: @section, description: 'key of Am', content: 'Am C Em Am')

        expect(@section.chords).to eq('Am C Em Am')
      end

      it 'does not fail if no chords exist' do
        expect(@section.chords).to eq('no chords exist for this section yet')
      end
    end
  end
end
