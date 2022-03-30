require 'rails_helper'

RSpec.describe 'the freewrites index' do
  context 'as a logged in user' do
    before(:each) do
      @user = User.create!(email: 'example@example.com', password: 'StrongPassword123')
      LyricLine.create(content: "This is a lyric line", stability: 'Balanced', created_at: 1.minute.ago)
      LyricLine.create(content: "Some other lyric", stability: 'Unbalanced', created_at: 1.day.ago)
      LyricLine.create(content: "I get knocked down, but I get up again", stability: 'Balanced', created_at: 1.week.ago)

      sign_in @user
    end

    it 'displays all the users lyric lines sorted from newest to oldest' do
      visit '/lyrics'
      expect("This is a lyric line").to appear_before("Some other lyric")
      expect("Some other lyric").to appear_before("I get knocked down, but I get up again")
    end

    it 'color codes lines based on stability'

    it 'filters out lines that are already part of a song section'
  end
end
