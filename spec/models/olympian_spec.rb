require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of :name}
  end
  describe 'relationships' do
    it { should belong_to :team}
    it { should belong_to :sport}
    it { should have_many(:medals).through(:medalists) }
  end
  describe '.class methods' do
    it 'can calc avg age' do
      expect(Olympian.average_age).to eq(0.26)
    end
  end
end
