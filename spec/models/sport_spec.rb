require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of :name}
  end
  describe 'relationships' do
    it { should have_many :olympians}
  end
end
