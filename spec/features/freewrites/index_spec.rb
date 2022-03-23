require 'rails_helper'

RSpec.describe 'the freewrites index' do
  context 'as a logged in user' do
    before(:each) do
      @user = User.create!(email: 'example@example.com', password: 'StrongPassword123')
      @f1 = @user.freewrites.create!(title: 'freewrite 1', description: 'foo', body: 'hello world')
      @f2 = @user.freewrites.create!(title: 'freewrite 2', description: 'bar', body: 'stuff')

      sign_in @user
    end

    it 'displays all freewrites for a user' do
      visit freewrites_path

      expect(page).to have_link(@f1.title)
      expect(page).to have_content(@f1.created_at.strftime('%D'))
      expect(page).to have_link(@f2.title)
      expect(page).to have_content(@f2.created_at.strftime('%D'))
    end

    it 'links to new freewrite page' do
      visit freewrites_path

      click_link("Add a freewriting entry")
      expect(current_path).to eq(new_freewrite_path)
    end
  end
end
