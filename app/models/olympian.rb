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

  def team_name
    self.team
  end

  def sport_name
    self.sport
  end

  def self.average_age
    average(:age).round(2)
  end

  def self.average_female_weight
    where(gender: "F").average(:weight).round(2)
  end

  def self.average_male_weight
    where(gender: "M").average(:weight).round(2)
  end

  def self.total_competing
    count(:id)
  end

  def self.sort(column = :age, search_term = 'youngest')
    if search_term == 'oldest'
      order("#{column} desc").first
    else
      order("#{column}").first
    end
  end

end
