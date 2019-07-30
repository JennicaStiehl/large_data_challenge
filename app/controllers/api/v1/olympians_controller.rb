class Api::V1::OlympiansController < ApplicationController

  def index
    olympians = Hash.new(0)
    results = Olympian.all.map do |olympian|
      olympians =  {
        name: olympian.name,
        team: olympian.team.name,
        age: olympian.age,
        sport: olympian.sport.name,
        total_medals_won: olympian.total_medals
      }
    end
    render json: final_results = {olympians: results}
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
