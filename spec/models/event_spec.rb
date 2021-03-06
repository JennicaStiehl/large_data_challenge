require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
  describe 'relationships' do
    it { should belong_to :sport}
    it { should have_many :medalists}
    it { should have_many(:olympians).through(:medalists) }
  end
end
