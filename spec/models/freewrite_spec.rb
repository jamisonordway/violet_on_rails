require 'rails_helper'

RSpec.describe Freewrite do
  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'class methods' do
    describe 'by_user' do
      it 'returs all freewrites for a particular user' do
        user = User.create!(email: 'example@example.com', password: 'StrongPassword123')
        f1 = user.freewrites.create!(title: 'freewrite 1', description: 'foo', body: 'hello world')
        f2 = user.freewrites.create!(title: 'freewrite 2', description: 'bar', body: 'stuff')
        f3 = user.freewrites.create!(title: 'freewrite 3', description: 'baz', body: 'body text')

        user_2 = User.create!(email: 'example2@example.com', password: 'StrongPassword123')
        f4 = user_2.freewrites.create!(title: 'freewrite 1', description: 'foo', body: 'hello world')

        expect(Freewrite.by_user(user.id)).to eq([f1, f2, f3])
      end
    end
  end
end
