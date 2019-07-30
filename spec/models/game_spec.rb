require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end
  describe 'relationships' do
  end
end
