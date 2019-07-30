class Olympian < ApplicationRecord
  belongs_to :team
  belongs_to :sport
  validates_presence_of :name
  validates_uniqueness_of :name
end
