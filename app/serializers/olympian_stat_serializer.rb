class OlympianStatSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
                  :average_male_weight,
                  :average_female_weight


end
