class Medal < ApplicationRecord
  validates_uniqueness_of :metal_type
  has_many :medalists
  has_many :olympians, through: :medalists

end
