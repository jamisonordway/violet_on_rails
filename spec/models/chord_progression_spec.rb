require 'rails_helper'

RSpec.describe ChordProgression do
  describe 'relationships' do
    it { should belong_to(:section) }
  end
end
