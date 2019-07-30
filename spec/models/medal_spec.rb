require 'rails_helper'

RSpec.describe Medal, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of :metal_type}
  end
  describe 'relationships' do
    it { should belong_to :medalist}
  end
end
