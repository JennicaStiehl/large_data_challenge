class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :weight, :height, :team_id, :total_medals

  belongs_to :team
end
