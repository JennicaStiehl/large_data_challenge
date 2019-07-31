require 'csv'
require 'pry'
require 'rake'
require 'benchmark'
require 'activerecord-import'
# require 'app/models/event.rb'
task import_event: :environment do
  require 'csv'
  file_path = 'lib/tasks/data'

  events = []
  Event.transaction do
    CSV.foreach(file_path, headers: true) do |row|
      events << { name: row[8],
        sport: Sport.find_by_name(row[7])
      }
    end
    events.uniq.compact.each do |e|
      event = Event.new(name: e[:name], sport_id: e[:sport][:id])
      event.save
    end
  end

end
