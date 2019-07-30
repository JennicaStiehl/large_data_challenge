class SportSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name

  has_many :events
end
