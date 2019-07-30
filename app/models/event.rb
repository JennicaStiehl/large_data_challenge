class Event < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :sport
  has_many :medalists
  has_many :olympians, through: :medalists

end
