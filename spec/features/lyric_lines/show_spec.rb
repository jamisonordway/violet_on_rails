require 'rails_helper'

RSpec.describe 'lyric line show' do
  before(:each) do
    @lyric = LyricLine.create(content: 'Some example lyrics', stability: 'Balanced')
  end

  it 'displays the lyric line with a link to edit' do
    visit lyric_line_path(@lyric)

    expect(page).to have_content('Some example lyrics')
    expect(page).to have_content('Balanced')
  end
end
