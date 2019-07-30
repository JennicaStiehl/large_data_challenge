require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of :name}
  end
  describe 'relationships' do
    it { should belong_to :team}
    it { should belong_to :sport}
  end
end
