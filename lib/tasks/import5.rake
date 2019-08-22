require 'csv'
require 'rake'
require 'benchmark'
require 'activerecord-import'
# require 'app/models/event.rb'
task import_medalist: :environment do
  require 'csv'
  file_path = 'lib/tasks/data'


  medalists = []
  Medalist.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      medalists << {
        olympian: Olympian.find_by_name(row[0]),
        game_id: 1,
        medal: Medal.find_by_metal_type(row[9]),
        event: Event.find_by_name(row[8])
      }
    end
    medalists.uniq.compact.each do |s|
      medalist = Medalist.new(s)
      medalist.save
    end
  end
  Medalist.where(medal: 1).destroy_all
end
