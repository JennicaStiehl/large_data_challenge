require 'rails_helper'

RSpec.describe Medal, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of :metal_type}
  end
  describe 'relationships' do
    it { should have_many :medalists}
    it { should have_many(:olympians).through(:medalists) }
  end
end
