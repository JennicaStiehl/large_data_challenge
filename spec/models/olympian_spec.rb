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
    @event2 = Event.create(name: "mens Boxing", sport_id: @box.id)
    @ali = Olympian.create(name: "Ali Cara", age:25, weight:85, height: 85, sport_id: @box.id, gender:"F", team_id: @som.id)
    @barb = Olympian.create(name: "Barabara Dali", age:50, weight:75, height: 60, sport_id: @box.id, gender:"F", team_id: @som.id)
    @cara = Olympian.create(name: "Cara Dara", age:75, weight:65, height: 60, sport_id: @box.id, gender:"F", team_id: @som.id)
    @medal1 = Medalist.create(event_id:@event.id, olympian_id: @ali.id, medal_id: @silver.id, game_id: @game.id)
    @medal2 = Medalist.create(event_id:@event.id, olympian_id: @ali.id, medal_id: @bronze.id, game_id: @game.id)
    @al = Olympian.create(name: "Al Cara", age:25, weight:85, height: 85, sport_id: @box.id, gender:"M", team_id: @som.id)
    @ben = Olympian.create(name: "Ben Dal", age:50, weight:80, height: 60, sport_id: @box.id, gender:"M", team_id: @som.id)
    @kevin = Olympian.create(name: "Kevin Dara", age:90, weight:65, height: 60, sport_id: @box.id, gender:"M", team_id: @som.id)
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
      expect(actual).to eq(0.525e2)
    end
    it 'can calc average weight for females' do
      actual = Olympian.average_female_weight.round(2)
      expect(actual).to eq(0.75e2)
    end
    it 'can calc average weight for males' do
      actual = Olympian.average_male_weight.round(2)
      expect(actual).to eq(0.7667e2)
    end
  end
end
