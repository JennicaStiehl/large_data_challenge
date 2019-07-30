require 'rails_helper'

RSpec.describe Olympian, type: :model do
  before :each do
    # Game.destroy_all
    # Team.destroy_all
    # Olympian.destroy_all
    @game = Game.create(name:"2016Summer")
    @box = Sport.create(name:"Box")
    @som = Team.create(name:"Somalia")
    @bronze = Medal.create(metal_type: "Bronze")
    @silver = Medal.create(metal_type: "Silver")
    @event = Event.create(name: "Womens Boxing", sport_id: @box.id)
    @ali = Olympian.create(name: "Ali Cara", age:25, weight:105, height: 61, sport_id: @box.id, gender:"F", team_id: @som.id)
    @barb = Olympian.create(name: "Barabara Dali", age:50, weight:105, height: 60, sport_id: @box.id, gender:"F", team_id: @som.id)
    @cara = Olympian.create(name: "Cara Dara", age:75, weight:100, height: 60, sport_id: @box.id, gender:"F", team_id: @som.id)
    @medal1 = Medalist.create(event_id:@event.id, olympian_id: @ali.id, medal_id: @silver.id, game_id: @game.id)
    @medal2 = Medalist.create(event_id:@event.id, olympian_id: @ali.id, medal_id: @bronze.id, game_id: @game.id)
  end

  describe 'validations' do
    it { should validate_uniqueness_of :name}
  end

  describe 'relationships' do
    it { should belong_to :team}
    it { should belong_to :sport}
    it { should have_many(:medals).through(:medalists) }
  end

  describe '#instance methods' do
    it 'can calc total medals won' do
      actual = @ali.total_medals
      expect(actual).to eq(2)
    end
  end

  describe '.class methods' do
    it 'can calc avg age' do
      actual = Olympian.average_age
      expect(actual).to eq(0.5e2)
    end
  end
end
