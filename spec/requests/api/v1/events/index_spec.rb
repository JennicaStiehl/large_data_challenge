require "rails_helper"

RSpec.describe "as a visitor", type: :request do
  before :each do
    @game = Game.create(name:"2016Summer")
    @box = Sport.create(name:"Boxing")
    @soccer = Sport.create(name:"Soccer")
    @bad = Sport.create(name:"Badminton")
    @som = Team.create(name:"Somalia")
    @bronze = Medal.create(metal_type: "Bronze")
    @silver = Medal.create(metal_type: "Silver")
    @event = Event.create(name: "Womens Boxing", sport_id: @box.id)
    @event2 = Event.create(name: "mens Boxing", sport_id: @box.id)
    @event3 = Event.create(name: "mens soccer", sport_id: @soccer.id)
    @event5 = Event.create(name: "mens Badminton", sport_id: @bad.id)
    @event6 = Event.create(name: "womens Badminton", sport_id: @bad.id)
    @event4 = Event.create(name: "womens soccer", sport_id: @soccer.id)
    @ali = Olympian.create(name: "Ali Cara", age:25, weight:85, height: 85, sport_id: @box.id, gender:"F", team_id: @som.id)
    @barb = Olympian.create(name: "Barabara Dali", age:50, weight:75, height: 60, sport_id: @box.id, gender:"F", team_id: @som.id)
    @cara = Olympian.create(name: "Cara Dara", age:75, weight:65, height: 60, sport_id: @box.id, gender:"F", team_id: @som.id)
    @medal1 = Medalist.create(event_id:@event.id, olympian_id: @ali.id, medal_id: @silver.id, game_id: @game.id)
    @medal2 = Medalist.create(event_id:@event.id, olympian_id: @ali.id, medal_id: @bronze.id, game_id: @game.id)
    @al = Olympian.create(name: "Al Cara", age:26, weight:85, height: 85, sport_id: @box.id, gender:"M", team_id: @som.id)
    @ben = Olympian.create(name: "Ben Dal", age:49, weight:80, height: 60, sport_id: @box.id, gender:"M", team_id: @som.id)
    @kevin = Olympian.create(name: "Kevin Dara", age:90, weight:65, height: 60, sport_id: @box.id, gender:"M", team_id: @som.id)
  end
  it "I can see all the events" do
    get "/api/v1/events"
    expect(response).to be_successful
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:events][0][:sport]).to eq("Boxing")
    expect(results[:events][0][:events]).to eq([@event.name, @event2.name])
    expect(results[:events][1][:sport]).to eq("Soccer")
    expect(results[:events][1][:events]).to eq([@event3.name, @event4.name])
  end
end
