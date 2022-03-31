require 'rails_helper'

RSpec.describe 'new lyric line' do
  it 'creates a new lyric line' do
    visit new_lyric_line_path

    fill_in(:lyric_line_content, with: 'Some example lyrics')
    click_button 'Save'

    expect(current_path).to eq(new_lyric_line_path)
    expect(page).to have_content('Some example lyrics')
    expect(page).to have_content('Estimated stability: Balanced')
  end
end
