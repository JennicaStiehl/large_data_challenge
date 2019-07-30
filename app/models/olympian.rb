class Olympian < ApplicationRecord
  belongs_to :team
  belongs_to :sport
  has_many :medalists
  has_many :medals, through: :medalists
  validates_presence_of :name
  validates_uniqueness_of :name
end
