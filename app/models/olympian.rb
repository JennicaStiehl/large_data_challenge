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

  def self.average_female_weight
    where(gender: "F").average(:weight)
  end

  def self.average_male_weight
    where(gender: "M").average(:weight)
  end

  def self.total_competing
    count(:id)
  end

end
