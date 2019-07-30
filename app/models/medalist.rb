class Medalist < ApplicationRecord
  belongs_to :olympian
  belongs_to :event
  belongs_to :medal

end
