require "rails_helper"

RSpec.describe "as a registered user", type: :request do
  before :each do
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
  it "I can see all the active parts in the system" do
    get "/api/v1/olympians"
    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:olympians][0][:name]).to eq("Ali Cara")
    expect(results[:olympians][0][:age]).to eq(25)
    expect(results[:olympians][0][:team]).to eq("Somalia")
    expect(results[:olympians][0][:sport]).to eq("Box")
  end
end
