require 'rails_helper'

RSpec.describe 'the freewrites index' do
  context 'as a logged in user' do
    before(:each) do
      @user = User.create!(email: 'example@example.com', password: 'StrongPassword123')
      @line_1 = LyricLine.create(content: "This is a lyric line", stability: 'Balanced', created_at: 1.minute.ago)
      @line_2 = LyricLine.create(content: "Some other lyric", stability: 'Unbalanced', created_at: 1.day.ago)
      @line_3 = LyricLine.create(content: "I get knocked down, but I get up again", stability: 'Balanced', created_at: 1.week.ago)

      sign_in @user
    end

    it 'displays all the users lyric lines sorted from newest to oldest' do
      visit '/lyrics'
      expect("This is a lyric line").to appear_before("Some other lyric")
      expect("Some other lyric").to appear_before("I get knocked down, but I get up again")
    end

    it 'has a link to add lyric lines to a song section' do
      @song = @user.songs.create(title: 'Song 1', mood: 'thoughtful')
      @section = @user.sections.create(label: 'A', stability: 'Very Balanced', song: @song)
#     when I visit '/lyrics',
# and I click 'Add lines to a section'
# a dropdown select appears with existing song sections and an option for a new section
# and when I choose a section from the dropdown select
# check boxes appear next to each lyric line
# and when I select the desired lines
# and click 'Save',
# I am taken to the section show page with the lyrics added.
      visit lyric_lines_path
      click_link("Add lyrics to a Song Section")
      select('Chorus for Song 1', from: 'section')
      check()
      click_button('Save')
      expect(current_path).to eq(sections_path(@section))
      expect(page).to have_content()
    end

    it 'color codes lines based on stability'

    it 'filters out lines that are already part of a song section'
  end
end
