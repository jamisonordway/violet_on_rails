require 'rails_helper'

RSpec.describe Song do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:sections) }
  end
end
