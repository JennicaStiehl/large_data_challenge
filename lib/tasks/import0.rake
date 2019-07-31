require 'csv'
require 'pry'
require 'rake'
require 'benchmark'
require 'activerecord-import'
# require_relative '../../db/data/2016'
# require 'app/models/event.rb'
task import_sport: :environment do
  require 'csv'
  file_path = 'lib/tasks/data'

  sports = []
  Sport.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      sports << row[7]
    end
    sports.uniq.compact.each do |s|
      sport = Sport.new(name: s)
      sport.save
    end
  end
end
