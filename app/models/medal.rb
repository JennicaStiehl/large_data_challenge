class Medal < ApplicationRecord
  validates_uniqueness_of :metal_type

end
