require 'csv'
require 'rake'
require 'benchmark'
require 'activerecord-import'
# require 'app/models/event.rb'
task import_olympian: :environment do
  require 'csv'
  file_path = 'lib/tasks/data'


  olympians = []
  Olympian.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      olympians << {
        name: row[0],
        gender: row[1],
        age: row[2],
        height: row[3],
        weight: row[4],
        team: Team.find_by_name(row[5]),
        sport: Sport.find_by_name(row[7])
      }
    end
    olympians.uniq.compact.each do |s|
      olympian = Olympian.new(s)
      olympian.save
    end
  end




end
