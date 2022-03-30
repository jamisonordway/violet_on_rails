require 'rails_helper'

RSpec.describe 'the freewrites index' do
  context 'as a logged in user' do
    before(:each) do
      @user = User.create!(email: 'example@example.com', password: 'StrongPassword123')
      LyricLine.create(content: "This is a lyric line", stability: 'Balanced')
      LyricLine.create(content: "Some other lyric", stability: 'Unbalanced')
      LyricLine.create(content: "I get knocked down, but I get up again", stability: 'Balanced')

      sign_in @user
    end

    it 'displays all the users lyric lines sorted from newest to oldest' do
      visit '/lyrics'
      expect(page).to have_content("This is a lyric line")
      expect(page).to have_content("Some other lyric")
      expect(page).to have_content("I get knocked down, but I get up again")
    end

    it 'color codes lines based on stability'

    it 'filters out lines that are already part of a song section'
  end
end
