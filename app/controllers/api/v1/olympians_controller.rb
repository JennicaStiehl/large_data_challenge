class Api::V1::OlympiansController < ApplicationController

  def stats
    stats = {"olympian_stats":
      {"total_competing_olympians": Olympian.total_competing,
        "average_weight": {
          "unit": "kg",
          "male_olympians": Olympian.average_male_weight,
          "female_olympians": Olympian.average_female_weight
        },
      "average_age": Olympian.average_age
    }
  }
    render json: stats

  end

end
