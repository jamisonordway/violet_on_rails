require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:songs) }
    it { should have_many(:sections) }
    it { should have_many(:freewrites) }
  end

  describe "instance methods" do
    describe "freewrite_total" do
      it 'returns the total count of freewrite entries for a user' do
        user = User.create!(email: 'example@example.com', password: 'StrongPassword123')
        f1 = user.freewrites.create!(title: 'freewrite 1', description: 'foo', body: 'hello world', created_at: 2.days.ago)
        f2 = user.freewrites.create!(title: 'freewrite 2', description: 'bar', body: 'stuff', created_at: 1.days.ago)
        user_2 = User.create!(email: 'example2@example.com', password: 'StrongPassword123')
        f4 = user_2.freewrites.create!(title: 'freewrite 1', description: 'foo', body: 'hello world')

        expect(user.freewrite_total).to eq(2)
      end
    end

    describe "writing_streak" do
      it 'keeps track of a successful daily writing streak' do
        user = User.create!(email: 'example@example.com', password: 'StrongPassword123')
        f1 = user.freewrites.create!(title: 'freewrite 1', description: 'foo', body: 'hello world', created_at: 2.days.ago)
        f2 = user.freewrites.create!(title: 'freewrite 2', description: 'bar', body: 'stuff', created_at: 1.days.ago)
        f3 = user.freewrites.create!(title: 'freewrite 3', description: 'baz', body: 'body text', created_at: 1.hour.ago)

        expect(user.writing_streak).to eq(3)
      end

      it 'keeps resets writing streak to zero if a day is missed' do
        user = User.create!(email: 'example@example.com', password: 'StrongPassword123')
        f1 = user.freewrites.create!(title: 'freewrite 1', description: 'foo', body: 'hello world', created_at: 5.days.ago)
        f2 = user.freewrites.create!(title: 'freewrite 2', description: 'bar', body: 'stuff', created_at: 4.days.ago)

        expect(user.writing_streak).to eq(0)
      end
    end
  end
end
