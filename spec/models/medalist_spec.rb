require 'rails_helper'

RSpec.describe Medalist, type: :model do
  describe 'validations' do
  end
  describe 'relationships' do
    it { should belong_to :olympian}
    it { should belong_to :event}
  end
end
