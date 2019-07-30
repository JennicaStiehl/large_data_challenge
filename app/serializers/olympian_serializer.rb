class OlympianSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :age, :total_medals

end
