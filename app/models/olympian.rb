class Olympian < ApplicationRecord
  belongs_to :team
  belongs_to :sport
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :medalists
  has_many :medals, through: :medalists

  def total_medals
    self.medals.count
  end

  def self.average_age
    average(:age)
  end


end
