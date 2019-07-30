class Api::V1::OlympiansController < ApplicationController

  def index
    if params[:age]
      to_map = []
      to_map << Olympian.sort(params.keys[0], params[:age])
    else
      to_map = Olympian.all
    end
    olympians = Hash.new(0)
    results = to_map.map do |olympian|
      olympians =  {
        name: olympian.name,
        team: olympian.team.name,
        age: olympian.age,
        sport: olympian.sport.name,
        total_medals_won: olympian.total_medals
      }
    end
    olympians = {olympians: results}
    render json: olympians
  end

  def stats
    stats = {olympian_stats:
      {total_competing_olympians: Olympian.total_competing,
        average_weight: {
          unit: "kg",
          male_olympians: Olympian.average_male_weight,
          female_olympians: Olympian.average_female_weight
        },
      average_age: Olympian.average_age
    }
  }
    render json: stats
  end

end
